// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_available.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAvailableImpl _$$UserAvailableImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['isAvailable'],
    disallowNullValues: const ['isAvailable'],
  );
  return _$UserAvailableImpl(
    isAvailable: json['isAvailable'] as bool,
  );
}

Map<String, dynamic> _$$UserAvailableImplToJson(_$UserAvailableImpl instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
    };
