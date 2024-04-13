// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TokenFailure {
  String get message => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, StackTrace stackTrace)
        unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, StackTrace stackTrace)? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, StackTrace stackTrace)? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedTokenFailure value) unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedTokenFailure value)? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedTokenFailure value)? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TokenFailureCopyWith<TokenFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenFailureCopyWith<$Res> {
  factory $TokenFailureCopyWith(
          TokenFailure value, $Res Function(TokenFailure) then) =
      _$TokenFailureCopyWithImpl<$Res, TokenFailure>;
  @useResult
  $Res call({String message, StackTrace stackTrace});
}

/// @nodoc
class _$TokenFailureCopyWithImpl<$Res, $Val extends TokenFailure>
    implements $TokenFailureCopyWith<$Res> {
  _$TokenFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stackTrace = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnauthorizedTokenFailureImplCopyWith<$Res>
    implements $TokenFailureCopyWith<$Res> {
  factory _$$UnauthorizedTokenFailureImplCopyWith(
          _$UnauthorizedTokenFailureImpl value,
          $Res Function(_$UnauthorizedTokenFailureImpl) then) =
      __$$UnauthorizedTokenFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, StackTrace stackTrace});
}

/// @nodoc
class __$$UnauthorizedTokenFailureImplCopyWithImpl<$Res>
    extends _$TokenFailureCopyWithImpl<$Res, _$UnauthorizedTokenFailureImpl>
    implements _$$UnauthorizedTokenFailureImplCopyWith<$Res> {
  __$$UnauthorizedTokenFailureImplCopyWithImpl(
      _$UnauthorizedTokenFailureImpl _value,
      $Res Function(_$UnauthorizedTokenFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stackTrace = null,
  }) {
    return _then(_$UnauthorizedTokenFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$UnauthorizedTokenFailureImpl implements UnauthorizedTokenFailure {
  const _$UnauthorizedTokenFailureImpl(
      {required this.message, this.stackTrace = StackTrace.empty});

  @override
  final String message;
  @override
  @JsonKey()
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'TokenFailure.unauthorized(message: $message, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedTokenFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedTokenFailureImplCopyWith<_$UnauthorizedTokenFailureImpl>
      get copyWith => __$$UnauthorizedTokenFailureImplCopyWithImpl<
          _$UnauthorizedTokenFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, StackTrace stackTrace)
        unauthorized,
  }) {
    return unauthorized(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, StackTrace stackTrace)? unauthorized,
  }) {
    return unauthorized?.call(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, StackTrace stackTrace)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnauthorizedTokenFailure value) unauthorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UnauthorizedTokenFailure value)? unauthorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnauthorizedTokenFailure value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedTokenFailure implements TokenFailure {
  const factory UnauthorizedTokenFailure(
      {required final String message,
      final StackTrace stackTrace}) = _$UnauthorizedTokenFailureImpl;

  @override
  String get message;
  @override
  StackTrace get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$UnauthorizedTokenFailureImplCopyWith<_$UnauthorizedTokenFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CredentialFailure {
  String get message => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, StackTrace stackTrace) $default, {
    required TResult Function(String message, StackTrace stackTrace) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, StackTrace stackTrace)? $default, {
    TResult? Function(String message, StackTrace stackTrace)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, StackTrace stackTrace)? $default, {
    TResult Function(String message, StackTrace stackTrace)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmailCredentialFailure value) $default, {
    required TResult Function(RefreshCredentialFailure value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmailCredentialFailure value)? $default, {
    TResult? Function(RefreshCredentialFailure value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmailCredentialFailure value)? $default, {
    TResult Function(RefreshCredentialFailure value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CredentialFailureCopyWith<CredentialFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialFailureCopyWith<$Res> {
  factory $CredentialFailureCopyWith(
          CredentialFailure value, $Res Function(CredentialFailure) then) =
      _$CredentialFailureCopyWithImpl<$Res, CredentialFailure>;
  @useResult
  $Res call({String message, StackTrace stackTrace});
}

/// @nodoc
class _$CredentialFailureCopyWithImpl<$Res, $Val extends CredentialFailure>
    implements $CredentialFailureCopyWith<$Res> {
  _$CredentialFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stackTrace = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshCredentialFailureImplCopyWith<$Res>
    implements $CredentialFailureCopyWith<$Res> {
  factory _$$RefreshCredentialFailureImplCopyWith(
          _$RefreshCredentialFailureImpl value,
          $Res Function(_$RefreshCredentialFailureImpl) then) =
      __$$RefreshCredentialFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, StackTrace stackTrace});
}

/// @nodoc
class __$$RefreshCredentialFailureImplCopyWithImpl<$Res>
    extends _$CredentialFailureCopyWithImpl<$Res,
        _$RefreshCredentialFailureImpl>
    implements _$$RefreshCredentialFailureImplCopyWith<$Res> {
  __$$RefreshCredentialFailureImplCopyWithImpl(
      _$RefreshCredentialFailureImpl _value,
      $Res Function(_$RefreshCredentialFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stackTrace = null,
  }) {
    return _then(_$RefreshCredentialFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$RefreshCredentialFailureImpl implements RefreshCredentialFailure {
  const _$RefreshCredentialFailureImpl(
      {this.message = 'no refresh token', this.stackTrace = StackTrace.empty});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'CredentialFailure.refresh(message: $message, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshCredentialFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshCredentialFailureImplCopyWith<_$RefreshCredentialFailureImpl>
      get copyWith => __$$RefreshCredentialFailureImplCopyWithImpl<
          _$RefreshCredentialFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, StackTrace stackTrace) $default, {
    required TResult Function(String message, StackTrace stackTrace) refresh,
  }) {
    return refresh(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, StackTrace stackTrace)? $default, {
    TResult? Function(String message, StackTrace stackTrace)? refresh,
  }) {
    return refresh?.call(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, StackTrace stackTrace)? $default, {
    TResult Function(String message, StackTrace stackTrace)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(message, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmailCredentialFailure value) $default, {
    required TResult Function(RefreshCredentialFailure value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmailCredentialFailure value)? $default, {
    TResult? Function(RefreshCredentialFailure value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmailCredentialFailure value)? $default, {
    TResult Function(RefreshCredentialFailure value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshCredentialFailure implements CredentialFailure {
  const factory RefreshCredentialFailure(
      {final String message,
      final StackTrace stackTrace}) = _$RefreshCredentialFailureImpl;

  @override
  String get message;
  @override
  StackTrace get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$RefreshCredentialFailureImplCopyWith<_$RefreshCredentialFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailCredentialFailureImplCopyWith<$Res>
    implements $CredentialFailureCopyWith<$Res> {
  factory _$$EmailCredentialFailureImplCopyWith(
          _$EmailCredentialFailureImpl value,
          $Res Function(_$EmailCredentialFailureImpl) then) =
      __$$EmailCredentialFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, StackTrace stackTrace});
}

/// @nodoc
class __$$EmailCredentialFailureImplCopyWithImpl<$Res>
    extends _$CredentialFailureCopyWithImpl<$Res, _$EmailCredentialFailureImpl>
    implements _$$EmailCredentialFailureImplCopyWith<$Res> {
  __$$EmailCredentialFailureImplCopyWithImpl(
      _$EmailCredentialFailureImpl _value,
      $Res Function(_$EmailCredentialFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? stackTrace = null,
  }) {
    return _then(_$EmailCredentialFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$EmailCredentialFailureImpl implements EmailCredentialFailure {
  const _$EmailCredentialFailureImpl(
      {this.message = 'invalid credentials',
      this.stackTrace = StackTrace.empty});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'CredentialFailure(message: $message, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailCredentialFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailCredentialFailureImplCopyWith<_$EmailCredentialFailureImpl>
      get copyWith => __$$EmailCredentialFailureImplCopyWithImpl<
          _$EmailCredentialFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, StackTrace stackTrace) $default, {
    required TResult Function(String message, StackTrace stackTrace) refresh,
  }) {
    return $default(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String message, StackTrace stackTrace)? $default, {
    TResult? Function(String message, StackTrace stackTrace)? refresh,
  }) {
    return $default?.call(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, StackTrace stackTrace)? $default, {
    TResult Function(String message, StackTrace stackTrace)? refresh,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(message, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmailCredentialFailure value) $default, {
    required TResult Function(RefreshCredentialFailure value) refresh,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmailCredentialFailure value)? $default, {
    TResult? Function(RefreshCredentialFailure value)? refresh,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmailCredentialFailure value)? $default, {
    TResult Function(RefreshCredentialFailure value)? refresh,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class EmailCredentialFailure implements CredentialFailure {
  const factory EmailCredentialFailure(
      {final String message,
      final StackTrace stackTrace}) = _$EmailCredentialFailureImpl;

  @override
  String get message;
  @override
  StackTrace get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$EmailCredentialFailureImplCopyWith<_$EmailCredentialFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
