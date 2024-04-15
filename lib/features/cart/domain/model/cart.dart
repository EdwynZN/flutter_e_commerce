import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  Cart._();

  factory Cart({
    required final List<PurchasedItem> items,
  }) = _Cart;

  late final double total = items.fold(
    0,
    (previousValue, element) => previousValue + (element.price * element.quantity),
  );

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class PurchasedItem with _$PurchasedItem {

  @HiveType(typeId: 0, adapterName: 'PurchasedItemAdapter')
  const factory PurchasedItem({
    @HiveField(0) required final int id,
    @HiveField(1) required final ItemProduct product,
    @HiveField(2) required final int quantity,
    @HiveField(3) required final double price,
  }) = _PurchasedItem;

  factory PurchasedItem.fromJson(Map<String, dynamic> json) =>
      _$PurchasedItemFromJson(json);
}

@Freezed(copyWith: false)
class ItemProduct with _$ItemProduct {

  @HiveType(typeId: 1, adapterName: 'ItemProductAdapter')
  const factory ItemProduct({
    @HiveField(0) required final int id,
    @HiveField(1) required final String name,
  }) = _ItemProduct;

  factory ItemProduct.fromJson(Map<String, dynamic> json) =>
      _$ItemProductFromJson(json);
}
