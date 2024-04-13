import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
sealed class Session with _$Session {
  const factory Session({
    required OAuth oAuth,
    required Credential credential,
    required User userInfo,
  }) = OAuthSession;

  const factory Session.initial({Credential? credential}) = NoSession;
}