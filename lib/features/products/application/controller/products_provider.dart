import 'package:flutter_e_commerce/features/products/application/controller/filter_provider.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product_filter_options.dart';
import 'package:flutter_e_commerce/features/products/domain/product_repository.dart';
import 'package:flutter_e_commerce/features/products/infrastructure/data/platzi_product_api.dart';
import 'package:flutter_e_commerce/features/products/infrastructure/implementation/platzi_product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final api = ref.watch(platziProductsApiProvider);
  return PlatziProductRepository(api: api);
}

@riverpod
class ProductNotifier extends AutoDisposeAsyncNotifier<List<Product>> {
  @override
  FutureOr<List<Product>> build() {
    final repository = ref.watch(productRepositoryProvider);
    final search = ref.watch(filterNotifierProvider);
    return repository.all(filter: ProductFilterOptions(title: search));
  }

  Future<void> refresh() async {
    if (state.isRefreshing) {
      return;
    }
    ref.invalidateSelf();
  }
}
