import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_filter_options.freezed.dart';

@freezed
class ProductFilterOptions with _$ProductFilterOptions {
  const factory ProductFilterOptions({
    required final String title,
  }) = _ProductFilterOptions;
	
}
