import 'package:collection/collection.dart';
import 'package:flutter_e_commerce/features/cart/application/controller/cart_provider.dart';
import 'package:flutter_e_commerce/features/products/application/controller/products_provider.dart';
import 'package:flutter_e_commerce/features/products/application/model/item.dart';
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

@riverpod
Future<Item> item(ItemRef ref, {required int id}) async {
  final product = await ref.watch(productProvider(id: id).future);
  final cart = await ref.watch(cartControllerProvider.future);
  final findItem =
      cart.items.firstWhereOrNull((cb) => cb.product.id == product.id);
  if (findItem == null) {
    return Item(
      product: product,
      quantity: 0,
      id: 0,
    );
  }
  return Item(
    product: product,
    id: findItem.id,
    quantity: findItem.quantity,
  );
}
