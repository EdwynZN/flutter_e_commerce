import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class Pagination with _$Pagination {
  const Pagination._();

  const factory Pagination({
    @Default(0) final int offset,
    @Default(20) final int limit,
  }) = _Pagination;

  Pagination nextPage([int? limit]) {
    return copyWith(offset: offset+1);
  }
}
