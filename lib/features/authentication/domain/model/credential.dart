import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential.freezed.dart';
part 'credential.g.dart';

@freezed
class Credential with _$Credential {
  
  const factory Credential({
    @JsonKey(required: true, disallowNullValue: true) required String email,
    @JsonKey(required: true, disallowNullValue: true) required String password,
  }) = EmailAuthCredential;

  const factory Credential.refreshToken({
    @JsonKey(required: true, disallowNullValue: true) required String email,
    @JsonKey(required: true, disallowNullValue: true) required String refreshToken,
  }) = RefreshTokenCredential;

  factory Credential.fromJson(Map<String, dynamic> json) => _$CredentialFromJson(json);
}
