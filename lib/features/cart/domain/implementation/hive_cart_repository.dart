import 'package:collection/collection.dart';
import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';
import 'package:flutter_e_commerce/features/cart/domain/service/cart_repository.dart';
import 'package:flutter_e_commerce/utils/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_cart_repository.g.dart';

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return HiveCartRepository();
}

class HiveCartRepository implements CartRepository {
  final Future<Box<PurchasedItem>> _box;

  HiveCartRepository() : _box = Hive.openBox(cartBox);

  @override
  Future<Cart> getAll() async {
    final box = await _box;
    final items = box.values.toList();
    return Cart(items: items);
  }

  @override
  Future<Cart> addItem(PurchasedItem item) async {
    final box = await _box;
    final savedItem =
        box.values.firstWhereOrNull((i) => i.product.id == item.product.id);
    if (savedItem != null) {
      item = savedItem.copyWith(
        price: item.price,
        product: item.product,
        quantity: item.quantity,
      );
    } else if (item.id == 0) {
      final lastIndex = box.length + 1;
      item = item.copyWith(id: lastIndex);
    }
    if (item.quantity < 1) {
      return deleteItem(item.id);
    }
    await box.put(item.id, item);
    return getAll();
  }

  @override
  Future<Cart> deleteItem(int id) async {
    final box = await _box;
    await box.delete(id);

    return getAll();
  }

  @override
  Future<Cart> updatePrice({required int id, required double price}) async {
    final box = await _box;
    final item = box.get(id);
    if (item != null) {
      await box.put(item.id, item.copyWith(price: price));
    }

    return getAll();
  }

  @override
  Future<Cart> updateQuantity({required int id, required int quantity}) async {
    if (quantity < 1) {
      return deleteItem(id);
    }
    final box = await _box;
    final item = box.get(id);
    if (item != null) {
      await box.put(item.id, item.copyWith(quantity: quantity));
    }

    return getAll();
  }

  @override
  Future<Cart> deleteAll() async {
    final box = await _box;
    await box.clear();
    return getAll();
  }
}
