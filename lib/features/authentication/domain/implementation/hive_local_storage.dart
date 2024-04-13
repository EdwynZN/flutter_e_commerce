import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_local_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveAuthenticationStorage<T extends UserCredential>
    implements AuthenticationLocalStorage<T> {
  final String key = 'Token';
  final Box<T> storage;

  const HiveAuthenticationStorage(this.storage);

  @override
  Future<void> delete() => storage.delete(key);

  @override
  Future<T?> read() async => storage.get(key);

  @override
  Future<void> write(T token) => storage.put(key, token);
}
