import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';

abstract interface class AuthenticationRepository {
  Future<User> getUserInfo();

  Future<OAuth> login(Credential credential);

  Future<UserCredential> refresh();

  Future<void> logout();
}
