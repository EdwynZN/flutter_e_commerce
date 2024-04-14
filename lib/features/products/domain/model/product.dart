import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

Object? _mapImages(Map<dynamic, dynamic> map, String key) {
  /// The api may return the images url within brackets and double quotes,
  /// which is a weird behavior so this mapping is to fix the url
  /// 
  /// before:
  /// '[\"https://i.imgur.com/4lTaHfF.jpeg\"'
  /// 
  /// after:
  /// 'https://i.imgur.com/4lTaHfF.jpeg'
  final excludedRegex = RegExp(r'\[|\]|\"');
  return (map[key] as List)
      .map((e) => {'image': (e as String).replaceAll(excludedRegex, '')})
      .toList();
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
