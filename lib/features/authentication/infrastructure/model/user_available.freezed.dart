// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_available.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAvailable _$UserAvailableFromJson(Map<String, dynamic> json) {
  return _UserAvailable.fromJson(json);
}

/// @nodoc
mixin _$UserAvailable {
  @JsonKey(required: true, disallowNullValue: true)
  bool get isAvailable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAvailableCopyWith<UserAvailable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAvailableCopyWith<$Res> {
  factory $UserAvailableCopyWith(
          UserAvailable value, $Res Function(UserAvailable) then) =
      _$UserAvailableCopyWithImpl<$Res, UserAvailable>;
  @useResult
  $Res call(
      {@JsonKey(required: true, disallowNullValue: true) bool isAvailable});
}

/// @nodoc
class _$UserAvailableCopyWithImpl<$Res, $Val extends UserAvailable>
    implements $UserAvailableCopyWith<$Res> {
  _$UserAvailableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAvailableImplCopyWith<$Res>
    implements $UserAvailableCopyWith<$Res> {
  factory _$$UserAvailableImplCopyWith(
          _$UserAvailableImpl value, $Res Function(_$UserAvailableImpl) then) =
      __$$UserAvailableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(required: true, disallowNullValue: true) bool isAvailable});
}

/// @nodoc
class __$$UserAvailableImplCopyWithImpl<$Res>
    extends _$UserAvailableCopyWithImpl<$Res, _$UserAvailableImpl>
    implements _$$UserAvailableImplCopyWith<$Res> {
  __$$UserAvailableImplCopyWithImpl(
      _$UserAvailableImpl _value, $Res Function(_$UserAvailableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
  }) {
    return _then(_$UserAvailableImpl(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAvailableImpl implements _UserAvailable {
  const _$UserAvailableImpl(
      {@JsonKey(required: true, disallowNullValue: true)
      required this.isAvailable});

  factory _$UserAvailableImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAvailableImplFromJson(json);

  @override
  @JsonKey(required: true, disallowNullValue: true)
  final bool isAvailable;

  @override
  String toString() {
    return 'UserAvailable(isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAvailableImpl &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAvailableImplCopyWith<_$UserAvailableImpl> get copyWith =>
      __$$UserAvailableImplCopyWithImpl<_$UserAvailableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAvailableImplToJson(
      this,
    );
  }
}

abstract class _UserAvailable implements UserAvailable {
  const factory _UserAvailable(
      {@JsonKey(required: true, disallowNullValue: true)
      required final bool isAvailable}) = _$UserAvailableImpl;

  factory _UserAvailable.fromJson(Map<String, dynamic> json) =
      _$UserAvailableImpl.fromJson;

  @override
  @JsonKey(required: true, disallowNullValue: true)
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$UserAvailableImplCopyWith<_$UserAvailableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
