import 'package:flutter_e_commerce/features/products/application/controller/filter_provider.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product_filter_options.dart';
import 'package:flutter_e_commerce/features/products/domain/product_repository.dart';
import 'package:flutter_e_commerce/features/products/infrastructure/data/platzi_product_api.dart';
import 'package:flutter_e_commerce/features/products/domain/implementation/platzi_product_repository.dart';
import 'package:flutter_e_commerce/shared/model/pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final api = ref.watch(platziProductsApiProvider);
  return PlatziProductRepository(api: api);
}

@riverpod
class ProductNotifier extends AutoDisposeAsyncNotifier<List<Product>> {
  late Pagination _pagination;
  late ProductFilterOptions _filter;

  @override
  FutureOr<List<Product>> build() {
    final repository = ref.watch(productRepositoryProvider);
    final search = ref.watch(filterNotifierProvider);
    _pagination = const Pagination();
    _filter = ProductFilterOptions(title: search);
    return repository.page(filter: _filter, pagination: _pagination);
  }

  ProductRepository get _repository => ref.read(productRepositoryProvider);

  bool get isLoading => state.isLoading || state.isRefreshing || state.isReloading;

  /// it knows is the last page because the length of the list is less than 
  /// the number of pages * the size of the page (it means the last apge retrieved 
  /// less than what we wanted therefore there is no more data)
  bool get isLastPage => state.maybeWhen(
        skipError: false,
        skipLoadingOnRefresh: false,
        skipLoadingOnReload: false,
        data: (data) {
          final realLength = (_pagination.offset + 1) * _pagination.limit;
          return data.length < realLength;
        },
        orElse: () => false,
      );

  Future<void> refresh() async {
    if (state.isRefreshing) {
      return;
    }
    ref.invalidateSelf();
  }

  /// if its loading or is [isLastPage] don't try to fetch the next one
  Future<void> nextPage() async {
    if (state.isLoading || isLastPage) {
      return;
    }
    state = const AsyncLoading<List<Product>>().copyWithPrevious(
      state,
      isRefresh: false,
    );
    final newPagination = _pagination.nextPage();
    final newPage = await AsyncValue.guard(() {
      return _repository.page(filter: _filter, pagination: newPagination);
    });
    if (newPage is AsyncData<List<Product>>) {
      _pagination = newPagination;
    }
    state = newPage.whenData(
      (products) {
        final previous = state.valueOrNull;
        return previous == null ? products : [...previous, ...products];
      },
    ).copyWithPrevious(state, isRefresh: false);
  }
}
