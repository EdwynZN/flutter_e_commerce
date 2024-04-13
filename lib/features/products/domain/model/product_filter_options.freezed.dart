// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filter_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductFilterOptions {
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductFilterOptionsCopyWith<ProductFilterOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterOptionsCopyWith<$Res> {
  factory $ProductFilterOptionsCopyWith(ProductFilterOptions value,
          $Res Function(ProductFilterOptions) then) =
      _$ProductFilterOptionsCopyWithImpl<$Res, ProductFilterOptions>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$ProductFilterOptionsCopyWithImpl<$Res,
        $Val extends ProductFilterOptions>
    implements $ProductFilterOptionsCopyWith<$Res> {
  _$ProductFilterOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFilterOptionsImplCopyWith<$Res>
    implements $ProductFilterOptionsCopyWith<$Res> {
  factory _$$ProductFilterOptionsImplCopyWith(_$ProductFilterOptionsImpl value,
          $Res Function(_$ProductFilterOptionsImpl) then) =
      __$$ProductFilterOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$ProductFilterOptionsImplCopyWithImpl<$Res>
    extends _$ProductFilterOptionsCopyWithImpl<$Res, _$ProductFilterOptionsImpl>
    implements _$$ProductFilterOptionsImplCopyWith<$Res> {
  __$$ProductFilterOptionsImplCopyWithImpl(_$ProductFilterOptionsImpl _value,
      $Res Function(_$ProductFilterOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$ProductFilterOptionsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductFilterOptionsImpl implements _ProductFilterOptions {
  const _$ProductFilterOptionsImpl({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'ProductFilterOptions(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFilterOptionsImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFilterOptionsImplCopyWith<_$ProductFilterOptionsImpl>
      get copyWith =>
          __$$ProductFilterOptionsImplCopyWithImpl<_$ProductFilterOptionsImpl>(
              this, _$identity);
}

abstract class _ProductFilterOptions implements ProductFilterOptions {
  const factory _ProductFilterOptions({required final String title}) =
      _$ProductFilterOptionsImpl;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ProductFilterOptionsImplCopyWith<_$ProductFilterOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
