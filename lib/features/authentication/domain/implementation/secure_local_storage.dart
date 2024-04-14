import 'dart:convert';

import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_local_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureAuthenticationStorage
    implements AuthenticationLocalStorage<UserCredential> {
  final FlutterSecureStorage _storage;
  static const String _key = 'user_credential';

  const SecureAuthenticationStorage(this._storage);

  @override
  Future<void> delete() => _storage.delete(key: _key);

  @override
  Future<UserCredential?> read() async {
    final result = await _storage.read(key: _key);
    if (result == null) {
      return null;
    }
    final jsonResult = json.decode(result);
    if (jsonResult == null) {
      return null;
    }
    return UserCredential.fromJson(jsonResult);
  }

  @override
  Future<void> write(UserCredential token) async {
    final value = json.encode(token);
    await _storage.write(key: _key, value: value);
  }
}
