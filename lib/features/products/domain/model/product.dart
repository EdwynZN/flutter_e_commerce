import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

Object? _mapImages(Map<dynamic, dynamic> map, String key) {
  return (map[key] as List).map((e) => {'image': e}).toList();
}

@freezed
class Product with _$Product {
  const factory Product({
    required final int id,
    required final String title,
    String? description,
    required final double price,
    @JsonKey(readValue: _mapImages) required final List<ProductImage> images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required final String image,
  }) = _ProductImage;

  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}
