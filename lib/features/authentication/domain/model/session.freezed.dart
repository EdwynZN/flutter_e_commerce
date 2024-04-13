// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Session {
  Credential? get credential => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(OAuth oAuth, Credential credential, User userInfo)
        $default, {
    required TResult Function(Credential? credential) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(OAuth oAuth, Credential credential, User userInfo)?
        $default, {
    TResult? Function(Credential? credential)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(OAuth oAuth, Credential credential, User userInfo)?
        $default, {
    TResult Function(Credential? credential)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(OAuthSession value) $default, {
    required TResult Function(NoSession value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(OAuthSession value)? $default, {
    TResult? Function(NoSession value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(OAuthSession value)? $default, {
    TResult Function(NoSession value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call({Credential credential});

  $CredentialCopyWith<$Res>? get credential;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credential = null,
  }) {
    return _then(_value.copyWith(
      credential: null == credential
          ? _value.credential!
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CredentialCopyWith<$Res>? get credential {
    if (_value.credential == null) {
      return null;
    }

    return $CredentialCopyWith<$Res>(_value.credential!, (value) {
      return _then(_value.copyWith(credential: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OAuthSessionImplCopyWith<$Res>
    implements $SessionCopyWith<$Res> {
  factory _$$OAuthSessionImplCopyWith(
          _$OAuthSessionImpl value, $Res Function(_$OAuthSessionImpl) then) =
      __$$OAuthSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OAuth oAuth, Credential credential, User userInfo});

  $OAuthCopyWith<$Res> get oAuth;
  @override
  $CredentialCopyWith<$Res> get credential;
  $UserCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$OAuthSessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$OAuthSessionImpl>
    implements _$$OAuthSessionImplCopyWith<$Res> {
  __$$OAuthSessionImplCopyWithImpl(
      _$OAuthSessionImpl _value, $Res Function(_$OAuthSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oAuth = null,
    Object? credential = null,
    Object? userInfo = null,
  }) {
    return _then(_$OAuthSessionImpl(
      oAuth: null == oAuth
          ? _value.oAuth
          : oAuth // ignore: cast_nullable_to_non_nullable
              as OAuth,
      credential: null == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OAuthCopyWith<$Res> get oAuth {
    return $OAuthCopyWith<$Res>(_value.oAuth, (value) {
      return _then(_value.copyWith(oAuth: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CredentialCopyWith<$Res> get credential {
    return $CredentialCopyWith<$Res>(_value.credential, (value) {
      return _then(_value.copyWith(credential: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }
}

/// @nodoc

class _$OAuthSessionImpl implements OAuthSession {
  const _$OAuthSessionImpl(
      {required this.oAuth, required this.credential, required this.userInfo});

  @override
  final OAuth oAuth;
  @override
  final Credential credential;
  @override
  final User userInfo;

  @override
  String toString() {
    return 'Session(oAuth: $oAuth, credential: $credential, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuthSessionImpl &&
            (identical(other.oAuth, oAuth) || other.oAuth == oAuth) &&
            (identical(other.credential, credential) ||
                other.credential == credential) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oAuth, credential, userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuthSessionImplCopyWith<_$OAuthSessionImpl> get copyWith =>
      __$$OAuthSessionImplCopyWithImpl<_$OAuthSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(OAuth oAuth, Credential credential, User userInfo)
        $default, {
    required TResult Function(Credential? credential) initial,
  }) {
    return $default(oAuth, credential, userInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(OAuth oAuth, Credential credential, User userInfo)?
        $default, {
    TResult? Function(Credential? credential)? initial,
  }) {
    return $default?.call(oAuth, credential, userInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(OAuth oAuth, Credential credential, User userInfo)?
        $default, {
    TResult Function(Credential? credential)? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(oAuth, credential, userInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(OAuthSession value) $default, {
    required TResult Function(NoSession value) initial,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(OAuthSession value)? $default, {
    TResult? Function(NoSession value)? initial,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(OAuthSession value)? $default, {
    TResult Function(NoSession value)? initial,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class OAuthSession implements Session {
  const factory OAuthSession(
      {required final OAuth oAuth,
      required final Credential credential,
      required final User userInfo}) = _$OAuthSessionImpl;

  OAuth get oAuth;
  @override
  Credential get credential;
  User get userInfo;
  @override
  @JsonKey(ignore: true)
  _$$OAuthSessionImplCopyWith<_$OAuthSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoSessionImplCopyWith<$Res>
    implements $SessionCopyWith<$Res> {
  factory _$$NoSessionImplCopyWith(
          _$NoSessionImpl value, $Res Function(_$NoSessionImpl) then) =
      __$$NoSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Credential? credential});

  @override
  $CredentialCopyWith<$Res>? get credential;
}

/// @nodoc
class __$$NoSessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$NoSessionImpl>
    implements _$$NoSessionImplCopyWith<$Res> {
  __$$NoSessionImplCopyWithImpl(
      _$NoSessionImpl _value, $Res Function(_$NoSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credential = freezed,
  }) {
    return _then(_$NoSessionImpl(
      credential: freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential?,
    ));
  }
}

/// @nodoc

class _$NoSessionImpl implements NoSession {
  const _$NoSessionImpl({this.credential});

  @override
  final Credential? credential;

  @override
  String toString() {
    return 'Session.initial(credential: $credential)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoSessionImpl &&
            (identical(other.credential, credential) ||
                other.credential == credential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, credential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoSessionImplCopyWith<_$NoSessionImpl> get copyWith =>
      __$$NoSessionImplCopyWithImpl<_$NoSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(OAuth oAuth, Credential credential, User userInfo)
        $default, {
    required TResult Function(Credential? credential) initial,
  }) {
    return initial(credential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(OAuth oAuth, Credential credential, User userInfo)?
        $default, {
    TResult? Function(Credential? credential)? initial,
  }) {
    return initial?.call(credential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(OAuth oAuth, Credential credential, User userInfo)?
        $default, {
    TResult Function(Credential? credential)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(credential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(OAuthSession value) $default, {
    required TResult Function(NoSession value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(OAuthSession value)? $default, {
    TResult? Function(NoSession value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(OAuthSession value)? $default, {
    TResult Function(NoSession value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NoSession implements Session {
  const factory NoSession({final Credential? credential}) = _$NoSessionImpl;

  @override
  Credential? get credential;
  @override
  @JsonKey(ignore: true)
  _$$NoSessionImplCopyWith<_$NoSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
