import 'package:collection/collection.dart';
import 'package:flutter_e_commerce/features/cart/application/controller/cart_provider.dart';
import 'package:flutter_e_commerce/features/products/application/controller/products_provider.dart';
import 'package:flutter_e_commerce/features/products/application/model/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_products_provider.g.dart';

/// productNotifierProvider returns and Async<List<Products>> and cartControllerProvider
/// a Async<Cart>. This provider will combine both to get an actual list of products with the cart values as a DTO to the UI
/// so this can be use it after checking that productNotifierProvider as valid data 
@riverpod
List<Item> itemsPagination(ItemsPaginationRef ref) {
  final products =
      ref.watch(productNotifierProvider.select((p) => p.valueOrNull));
  final cartItems = ref
      .watch(cartControllerProvider.select((cart) => cart.valueOrNull?.items));

  if (products == null) {
    return const [];
  }

  if (cartItems == null || cartItems.isEmpty) {
    return products
      .map((e) => Item(product: e, quantity: 0, id: 0))
      .toList();
  }

  return products.map(
    (p) {
      final findItem = cartItems.firstWhereOrNull(
        (cb) => cb.product.id == p.id,
      );
      return Item(
        product: p,
        quantity: findItem?.quantity ?? 0,
        id: findItem?.id ?? 0,
      );
    },
  ).toList();
}
