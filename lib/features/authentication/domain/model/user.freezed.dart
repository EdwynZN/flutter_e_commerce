// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', required: true, disallowNullValue: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', required: true, disallowNullValue: true)
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar', required: true)
  String? get photoURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true) int id,
      @JsonKey(name: 'name', required: true, disallowNullValue: true)
      String name,
      @JsonKey(name: 'email', required: true, disallowNullValue: true)
      String email,
      @JsonKey(name: 'avatar', required: true) String? photoURL});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? photoURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true) int id,
      @JsonKey(name: 'name', required: true, disallowNullValue: true)
      String name,
      @JsonKey(name: 'email', required: true, disallowNullValue: true)
      String email,
      @JsonKey(name: 'avatar', required: true) String? photoURL});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? photoURL = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: freezed == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id', required: true, disallowNullValue: true)
      required this.id,
      @JsonKey(name: 'name', required: true, disallowNullValue: true)
      required this.name,
      @JsonKey(name: 'email', required: true, disallowNullValue: true)
      required this.email,
      @JsonKey(name: 'avatar', required: true) this.photoURL});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  final int id;
  @override
  @JsonKey(name: 'name', required: true, disallowNullValue: true)
  final String name;
  @override
  @JsonKey(name: 'email', required: true, disallowNullValue: true)
  final String email;
  @override
  @JsonKey(name: 'avatar', required: true)
  final String? photoURL;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, photoURL: $photoURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, photoURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
          {@JsonKey(name: 'id', required: true, disallowNullValue: true)
          required final int id,
          @JsonKey(name: 'name', required: true, disallowNullValue: true)
          required final String name,
          @JsonKey(name: 'email', required: true, disallowNullValue: true)
          required final String email,
          @JsonKey(name: 'avatar', required: true) final String? photoURL}) =
      _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id', required: true, disallowNullValue: true)
  int get id;
  @override
  @JsonKey(name: 'name', required: true, disallowNullValue: true)
  String get name;
  @override
  @JsonKey(name: 'email', required: true, disallowNullValue: true)
  String get email;
  @override
  @JsonKey(name: 'avatar', required: true)
  String? get photoURL;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserCredential {
  OAuth? get oAuth => throw _privateConstructorUsedError;
  Credential get credential => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCredentialCopyWith<UserCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCredentialCopyWith<$Res> {
  factory $UserCredentialCopyWith(
          UserCredential value, $Res Function(UserCredential) then) =
      _$UserCredentialCopyWithImpl<$Res, UserCredential>;
  @useResult
  $Res call({OAuth? oAuth, Credential credential});

  $OAuthCopyWith<$Res>? get oAuth;
  $CredentialCopyWith<$Res> get credential;
}

/// @nodoc
class _$UserCredentialCopyWithImpl<$Res, $Val extends UserCredential>
    implements $UserCredentialCopyWith<$Res> {
  _$UserCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oAuth = freezed,
    Object? credential = null,
  }) {
    return _then(_value.copyWith(
      oAuth: freezed == oAuth
          ? _value.oAuth
          : oAuth // ignore: cast_nullable_to_non_nullable
              as OAuth?,
      credential: null == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OAuthCopyWith<$Res>? get oAuth {
    if (_value.oAuth == null) {
      return null;
    }

    return $OAuthCopyWith<$Res>(_value.oAuth!, (value) {
      return _then(_value.copyWith(oAuth: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CredentialCopyWith<$Res> get credential {
    return $CredentialCopyWith<$Res>(_value.credential, (value) {
      return _then(_value.copyWith(credential: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserCredentialImplCopyWith<$Res>
    implements $UserCredentialCopyWith<$Res> {
  factory _$$UserCredentialImplCopyWith(_$UserCredentialImpl value,
          $Res Function(_$UserCredentialImpl) then) =
      __$$UserCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OAuth? oAuth, Credential credential});

  @override
  $OAuthCopyWith<$Res>? get oAuth;
  @override
  $CredentialCopyWith<$Res> get credential;
}

/// @nodoc
class __$$UserCredentialImplCopyWithImpl<$Res>
    extends _$UserCredentialCopyWithImpl<$Res, _$UserCredentialImpl>
    implements _$$UserCredentialImplCopyWith<$Res> {
  __$$UserCredentialImplCopyWithImpl(
      _$UserCredentialImpl _value, $Res Function(_$UserCredentialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oAuth = freezed,
    Object? credential = null,
  }) {
    return _then(_$UserCredentialImpl(
      oAuth: freezed == oAuth
          ? _value.oAuth
          : oAuth // ignore: cast_nullable_to_non_nullable
              as OAuth?,
      credential: null == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
    ));
  }
}

/// @nodoc

class _$UserCredentialImpl implements _UserCredential {
  const _$UserCredentialImpl({this.oAuth, required this.credential});

  @override
  final OAuth? oAuth;
  @override
  final Credential credential;

  @override
  String toString() {
    return 'UserCredential(oAuth: $oAuth, credential: $credential)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCredentialImpl &&
            (identical(other.oAuth, oAuth) || other.oAuth == oAuth) &&
            (identical(other.credential, credential) ||
                other.credential == credential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oAuth, credential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCredentialImplCopyWith<_$UserCredentialImpl> get copyWith =>
      __$$UserCredentialImplCopyWithImpl<_$UserCredentialImpl>(
          this, _$identity);
}

abstract class _UserCredential implements UserCredential {
  const factory _UserCredential(
      {final OAuth? oAuth,
      required final Credential credential}) = _$UserCredentialImpl;

  @override
  OAuth? get oAuth;
  @override
  Credential get credential;
  @override
  @JsonKey(ignore: true)
  _$$UserCredentialImplCopyWith<_$UserCredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
