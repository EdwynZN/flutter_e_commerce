// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'email', 'avatar'],
    disallowNullValues: const ['id', 'name', 'email'],
  );
  return _$UserImpl(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    photoURL: json['avatar'] as String?,
  );
}

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.photoURL,
    };
