// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductNotFoundException {
  int get id => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductNotFoundExceptionCopyWith<ProductNotFoundException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductNotFoundExceptionCopyWith<$Res> {
  factory $ProductNotFoundExceptionCopyWith(ProductNotFoundException value,
          $Res Function(ProductNotFoundException) then) =
      _$ProductNotFoundExceptionCopyWithImpl<$Res, ProductNotFoundException>;
  @useResult
  $Res call({int id, StackTrace stackTrace});
}

/// @nodoc
class _$ProductNotFoundExceptionCopyWithImpl<$Res,
        $Val extends ProductNotFoundException>
    implements $ProductNotFoundExceptionCopyWith<$Res> {
  _$ProductNotFoundExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stackTrace = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductNotFoundExceptionImplCopyWith<$Res>
    implements $ProductNotFoundExceptionCopyWith<$Res> {
  factory _$$ProductNotFoundExceptionImplCopyWith(
          _$ProductNotFoundExceptionImpl value,
          $Res Function(_$ProductNotFoundExceptionImpl) then) =
      __$$ProductNotFoundExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, StackTrace stackTrace});
}

/// @nodoc
class __$$ProductNotFoundExceptionImplCopyWithImpl<$Res>
    extends _$ProductNotFoundExceptionCopyWithImpl<$Res,
        _$ProductNotFoundExceptionImpl>
    implements _$$ProductNotFoundExceptionImplCopyWith<$Res> {
  __$$ProductNotFoundExceptionImplCopyWithImpl(
      _$ProductNotFoundExceptionImpl _value,
      $Res Function(_$ProductNotFoundExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stackTrace = null,
  }) {
    return _then(_$ProductNotFoundExceptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ProductNotFoundExceptionImpl extends _ProductNotFoundException {
  const _$ProductNotFoundExceptionImpl(
      {required this.id, this.stackTrace = StackTrace.empty})
      : super._();

  @override
  final int id;
  @override
  @JsonKey()
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ProductNotFoundException(id: $id, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductNotFoundExceptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductNotFoundExceptionImplCopyWith<_$ProductNotFoundExceptionImpl>
      get copyWith => __$$ProductNotFoundExceptionImplCopyWithImpl<
          _$ProductNotFoundExceptionImpl>(this, _$identity);
}

abstract class _ProductNotFoundException extends ProductNotFoundException {
  const factory _ProductNotFoundException(
      {required final int id,
      final StackTrace stackTrace}) = _$ProductNotFoundExceptionImpl;
  const _ProductNotFoundException._() : super._();

  @override
  int get id;
  @override
  StackTrace get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$ProductNotFoundExceptionImplCopyWith<_$ProductNotFoundExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
