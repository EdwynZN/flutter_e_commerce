import 'package:collection/collection.dart';
import 'package:flutter_e_commerce/features/products/application/controller/products_provider.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/features/products/domain/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_product_provider.g.dart';

@riverpod
Future<Product> product(ProductRef ref, {required int id}) async {
  if (ref.exists(productNotifierProvider)) {
    final product = await ref.watch(productNotifierProvider.selectAsync(
      (data) => data.firstWhereOrNull((product) => product.id == id),
    ));
    if (product != null) {
      return product;
    }
  }
  final ProductRepository repository = ref.watch(productRepositoryProvider);
  return repository.detail(id: id);
}
