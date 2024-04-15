import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_available.freezed.dart';
part 'user_available.g.dart';

@freezed
class UserAvailable with _$UserAvailable {
  const factory UserAvailable({
    @JsonKey(required: true, disallowNullValue: true) required bool isAvailable,
  }) = _UserAvailable;
	
  factory UserAvailable.fromJson(Map<String, dynamic> json) =>
			_$UserAvailableFromJson(json);
}
