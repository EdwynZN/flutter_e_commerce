// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmailAuthCredentialImpl _$$EmailAuthCredentialImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['email', 'password'],
    disallowNullValues: const ['email', 'password'],
  );
  return _$EmailAuthCredentialImpl(
    email: json['email'] as String,
    password: json['password'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$$EmailAuthCredentialImplToJson(
        _$EmailAuthCredentialImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'runtimeType': instance.$type,
    };

_$RefreshTokenCredentialImpl _$$RefreshTokenCredentialImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['email', 'refreshToken'],
    disallowNullValues: const ['email', 'refreshToken'],
  );
  return _$RefreshTokenCredentialImpl(
    email: json['email'] as String,
    refreshToken: json['refreshToken'] as String,
    $type: json['runtimeType'] as String?,
  );
}

Map<String, dynamic> _$$RefreshTokenCredentialImplToJson(
        _$RefreshTokenCredentialImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'refreshToken': instance.refreshToken,
      'runtimeType': instance.$type,
    };
