import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';

abstract interface class CartRepository {

  /// If the item already exist it will be replaced
  Future<Cart> getAll();

  /// If the item already exist it will be replaced
  Future<Cart> addItem(PurchasedItem item);

  /// If the item doesn't exist this operation return the cart
  Future<Cart> updatePrice({required int id, required double price});

  /// If the item doesn't exist this operation return the cart
  Future<Cart> updateQuantity({required int id, required int quantity});

  Future<Cart> deleteItem(int id);

  Future<Cart> deleteAll();
}
