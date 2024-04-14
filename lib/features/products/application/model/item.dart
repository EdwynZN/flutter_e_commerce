import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required final Product product,
    required final int quantity,
    required final int id,
  }) = _Item;
}
