import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
sealed class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(required: true, disallowNullValue: true) required String name,
    @JsonKey(required: true, disallowNullValue: true) required String email,
    @JsonKey(required: true, disallowNullValue: true) required String password,
    @Default('https://i.imgur.com/xCvzudW.png')
    @JsonKey(defaultValue: 'https://i.imgur.com/xCvzudW.png') String avatar,
  }) = _UserInfo;
	
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
			_$UserInfoFromJson(json);
}
