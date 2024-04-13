import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth.freezed.dart';
part 'oauth.g.dart';

@freezed
class OAuth with _$OAuth {
  OAuth._();
  
  factory OAuth({
    @JsonKey(name: 'access_token', required: true, disallowNullValue: true)
        required String accessToken,
    @Default('Bearer') @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = AuthToken;

  late final String header = '$tokenType $accessToken';

  factory OAuth.fromJson(Map<String, dynamic> json) => _$OAuthFromJson(json);
}
