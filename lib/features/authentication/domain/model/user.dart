import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id', required: true, disallowNullValue: true) required int id,
    @JsonKey(name: 'name', required: true, disallowNullValue: true) required String name,
    @JsonKey(name: 'email', required: true, disallowNullValue: true) required String email,
    @JsonKey(name: 'avatar', required: true) String? photoURL,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserCredential with _$UserCredential {
  
  const factory UserCredential({
    OAuth? oAuth,
    required Credential credential,
  }) = _UserCredential;
}
