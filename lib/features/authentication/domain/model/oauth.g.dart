// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthTokenImpl _$$AuthTokenImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['access_token'],
    disallowNullValues: const ['access_token'],
  );
  return _$AuthTokenImpl(
    accessToken: json['access_token'] as String,
    tokenType: json['token_type'] as String? ?? 'Bearer',
    refreshToken: json['refresh_token'] as String?,
  );
}

Map<String, dynamic> _$$AuthTokenImplToJson(_$AuthTokenImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
    };
