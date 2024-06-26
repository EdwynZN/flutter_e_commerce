import 'package:collection/collection.dart';
import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';
import 'package:flutter_e_commerce/features/cart/domain/service/cart_repository.dart';
import 'package:flutter_e_commerce/shared/hive_boxes_name.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Family provider to have a repository per user.
/// Hive doesn't provide a way to query for column (or field) so having all items
/// of a cart in a class wrapper with the email would be way harder because filtering 
/// to create/delete would be by hand and not using a SQL language
/// (EmailWrapper(string email, List<Item> items) in a Hive.openBox<EmailWrapper>('name))
/// Instead we create a single box per email and avoid all that problem, in the end 
/// how a data source works shouldn't be an impediment to implement a repository
final cartRepositoryProvider = Provider.autoDispose.family<CartRepository, String>(
  (ref, String name) => HiveCartRepository._(name),
);

class HiveCartRepository implements CartRepository {
  final Future<Box<PurchasedItem>> _box;

  HiveCartRepository._(String subBox)
      : _box = Hive.openBox<PurchasedItem>('$cartBox$subBox');

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
