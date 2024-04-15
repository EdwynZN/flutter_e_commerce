// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAvailableException {
  String get email => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAvailableExceptionCopyWith<UserAvailableException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAvailableExceptionCopyWith<$Res> {
  factory $UserAvailableExceptionCopyWith(UserAvailableException value,
          $Res Function(UserAvailableException) then) =
      _$UserAvailableExceptionCopyWithImpl<$Res, UserAvailableException>;
  @useResult
  $Res call({String email, StackTrace stackTrace});
}

/// @nodoc
class _$UserAvailableExceptionCopyWithImpl<$Res,
        $Val extends UserAvailableException>
    implements $UserAvailableExceptionCopyWith<$Res> {
  _$UserAvailableExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? stackTrace = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAlreadyExistsExceptionImplCopyWith<$Res>
    implements $UserAvailableExceptionCopyWith<$Res> {
  factory _$$UserAlreadyExistsExceptionImplCopyWith(
          _$UserAlreadyExistsExceptionImpl value,
          $Res Function(_$UserAlreadyExistsExceptionImpl) then) =
      __$$UserAlreadyExistsExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, StackTrace stackTrace});
}

/// @nodoc
class __$$UserAlreadyExistsExceptionImplCopyWithImpl<$Res>
    extends _$UserAvailableExceptionCopyWithImpl<$Res,
        _$UserAlreadyExistsExceptionImpl>
    implements _$$UserAlreadyExistsExceptionImplCopyWith<$Res> {
  __$$UserAlreadyExistsExceptionImplCopyWithImpl(
      _$UserAlreadyExistsExceptionImpl _value,
      $Res Function(_$UserAlreadyExistsExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? stackTrace = null,
  }) {
    return _then(_$UserAlreadyExistsExceptionImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$UserAlreadyExistsExceptionImpl implements UserAlreadyExistsException {
  const _$UserAlreadyExistsExceptionImpl(
      {required this.email, this.stackTrace = StackTrace.empty});

  @override
  final String email;
  @override
  @JsonKey()
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'UserAvailableException(email: $email, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAlreadyExistsExceptionImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAlreadyExistsExceptionImplCopyWith<_$UserAlreadyExistsExceptionImpl>
      get copyWith => __$$UserAlreadyExistsExceptionImplCopyWithImpl<
          _$UserAlreadyExistsExceptionImpl>(this, _$identity);
}

abstract class UserAlreadyExistsException implements UserAvailableException {
  const factory UserAlreadyExistsException(
      {required final String email,
      final StackTrace stackTrace}) = _$UserAlreadyExistsExceptionImpl;

  @override
  String get email;
  @override
  StackTrace get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$UserAlreadyExistsExceptionImplCopyWith<_$UserAlreadyExistsExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
