// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'email', 'password'],
    disallowNullValues: const ['name', 'email', 'password'],
  );
  return _$UserInfoImpl(
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    avatar: json['avatar'] as String?,
  );
}

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
    };
