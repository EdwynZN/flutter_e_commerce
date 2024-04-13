// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return EmailAuthCredential.fromJson(json);
    case 'refreshToken':
      return RefreshTokenCredential.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Credential',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Credential {
  @JsonKey(required: true, disallowNullValue: true)
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)
        $default, {
    required TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)
        refreshToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)?
        $default, {
    TResult? Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)?
        refreshToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)?
        $default, {
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)?
        refreshToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmailAuthCredential value) $default, {
    required TResult Function(RefreshTokenCredential value) refreshToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmailAuthCredential value)? $default, {
    TResult? Function(RefreshTokenCredential value)? refreshToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmailAuthCredential value)? $default, {
    TResult Function(RefreshTokenCredential value)? refreshToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialCopyWith<Credential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialCopyWith<$Res> {
  factory $CredentialCopyWith(
          Credential value, $Res Function(Credential) then) =
      _$CredentialCopyWithImpl<$Res, Credential>;
  @useResult
  $Res call({@JsonKey(required: true, disallowNullValue: true) String email});
}

/// @nodoc
class _$CredentialCopyWithImpl<$Res, $Val extends Credential>
    implements $CredentialCopyWith<$Res> {
  _$CredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailAuthCredentialImplCopyWith<$Res>
    implements $CredentialCopyWith<$Res> {
  factory _$$EmailAuthCredentialImplCopyWith(_$EmailAuthCredentialImpl value,
          $Res Function(_$EmailAuthCredentialImpl) then) =
      __$$EmailAuthCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(required: true, disallowNullValue: true) String email,
      @JsonKey(required: true, disallowNullValue: true) String password});
}

/// @nodoc
class __$$EmailAuthCredentialImplCopyWithImpl<$Res>
    extends _$CredentialCopyWithImpl<$Res, _$EmailAuthCredentialImpl>
    implements _$$EmailAuthCredentialImplCopyWith<$Res> {
  __$$EmailAuthCredentialImplCopyWithImpl(_$EmailAuthCredentialImpl _value,
      $Res Function(_$EmailAuthCredentialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$EmailAuthCredentialImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailAuthCredentialImpl implements EmailAuthCredential {
  const _$EmailAuthCredentialImpl(
      {@JsonKey(required: true, disallowNullValue: true) required this.email,
      @JsonKey(required: true, disallowNullValue: true) required this.password,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$EmailAuthCredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailAuthCredentialImplFromJson(json);

  @override
  @JsonKey(required: true, disallowNullValue: true)
  final String email;
  @override
  @JsonKey(required: true, disallowNullValue: true)
  final String password;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Credential(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAuthCredentialImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAuthCredentialImplCopyWith<_$EmailAuthCredentialImpl> get copyWith =>
      __$$EmailAuthCredentialImplCopyWithImpl<_$EmailAuthCredentialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)
        $default, {
    required TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)
        refreshToken,
  }) {
    return $default(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)?
        $default, {
    TResult? Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)?
        refreshToken,
  }) {
    return $default?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)?
        $default, {
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)?
        refreshToken,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmailAuthCredential value) $default, {
    required TResult Function(RefreshTokenCredential value) refreshToken,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmailAuthCredential value)? $default, {
    TResult? Function(RefreshTokenCredential value)? refreshToken,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmailAuthCredential value)? $default, {
    TResult Function(RefreshTokenCredential value)? refreshToken,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailAuthCredentialImplToJson(
      this,
    );
  }
}

abstract class EmailAuthCredential implements Credential {
  const factory EmailAuthCredential(
      {@JsonKey(required: true, disallowNullValue: true)
      required final String email,
      @JsonKey(required: true, disallowNullValue: true)
      required final String password}) = _$EmailAuthCredentialImpl;

  factory EmailAuthCredential.fromJson(Map<String, dynamic> json) =
      _$EmailAuthCredentialImpl.fromJson;

  @override
  @JsonKey(required: true, disallowNullValue: true)
  String get email;
  @JsonKey(required: true, disallowNullValue: true)
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$EmailAuthCredentialImplCopyWith<_$EmailAuthCredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshTokenCredentialImplCopyWith<$Res>
    implements $CredentialCopyWith<$Res> {
  factory _$$RefreshTokenCredentialImplCopyWith(
          _$RefreshTokenCredentialImpl value,
          $Res Function(_$RefreshTokenCredentialImpl) then) =
      __$$RefreshTokenCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(required: true, disallowNullValue: true) String email,
      @JsonKey(required: true, disallowNullValue: true) String refreshToken});
}

/// @nodoc
class __$$RefreshTokenCredentialImplCopyWithImpl<$Res>
    extends _$CredentialCopyWithImpl<$Res, _$RefreshTokenCredentialImpl>
    implements _$$RefreshTokenCredentialImplCopyWith<$Res> {
  __$$RefreshTokenCredentialImplCopyWithImpl(
      _$RefreshTokenCredentialImpl _value,
      $Res Function(_$RefreshTokenCredentialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenCredentialImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenCredentialImpl implements RefreshTokenCredential {
  const _$RefreshTokenCredentialImpl(
      {@JsonKey(required: true, disallowNullValue: true) required this.email,
      @JsonKey(required: true, disallowNullValue: true)
      required this.refreshToken,
      final String? $type})
      : $type = $type ?? 'refreshToken';

  factory _$RefreshTokenCredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenCredentialImplFromJson(json);

  @override
  @JsonKey(required: true, disallowNullValue: true)
  final String email;
  @override
  @JsonKey(required: true, disallowNullValue: true)
  final String refreshToken;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Credential.refreshToken(email: $email, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenCredentialImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenCredentialImplCopyWith<_$RefreshTokenCredentialImpl>
      get copyWith => __$$RefreshTokenCredentialImplCopyWithImpl<
          _$RefreshTokenCredentialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)
        $default, {
    required TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)
        refreshToken,
  }) {
    return refreshToken(email, this.refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)?
        $default, {
    TResult? Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)?
        refreshToken,
  }) {
    return refreshToken?.call(email, this.refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true) String password)?
        $default, {
    TResult Function(
            @JsonKey(required: true, disallowNullValue: true) String email,
            @JsonKey(required: true, disallowNullValue: true)
            String refreshToken)?
        refreshToken,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken(email, this.refreshToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(EmailAuthCredential value) $default, {
    required TResult Function(RefreshTokenCredential value) refreshToken,
  }) {
    return refreshToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(EmailAuthCredential value)? $default, {
    TResult? Function(RefreshTokenCredential value)? refreshToken,
  }) {
    return refreshToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(EmailAuthCredential value)? $default, {
    TResult Function(RefreshTokenCredential value)? refreshToken,
    required TResult orElse(),
  }) {
    if (refreshToken != null) {
      return refreshToken(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenCredentialImplToJson(
      this,
    );
  }
}

abstract class RefreshTokenCredential implements Credential {
  const factory RefreshTokenCredential(
      {@JsonKey(required: true, disallowNullValue: true)
      required final String email,
      @JsonKey(required: true, disallowNullValue: true)
      required final String refreshToken}) = _$RefreshTokenCredentialImpl;

  factory RefreshTokenCredential.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenCredentialImpl.fromJson;

  @override
  @JsonKey(required: true, disallowNullValue: true)
  String get email;
  @JsonKey(required: true, disallowNullValue: true)
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$RefreshTokenCredentialImplCopyWith<_$RefreshTokenCredentialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
