import 'package:flutter_e_commerce/shared/model/domain_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_exception.freezed.dart';

sealed class ProductException implements DomainException {
  final String message;

  const ProductException(this.message);
}

@freezed
sealed class ProductNotFoundException with _$ProductNotFoundException 
  implements ProductException {
  const ProductNotFoundException._();

  const factory ProductNotFoundException({
    required final int id,
    @Default(StackTrace.empty) final StackTrace stackTrace,
  }) = _ProductNotFoundException;

  @override
  String get message => 'Product id: $id not found';
}
