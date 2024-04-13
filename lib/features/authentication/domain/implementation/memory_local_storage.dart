import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_local_repository.dart';

class MemAuthenticationStorage<T extends UserCredential>
    implements AuthenticationLocalStorage<T> {
  T? _credential;

  MemAuthenticationStorage();

  @override
  Future<void> delete() async => _credential = null;

  @override
  Future<T?> read() async => _credential;

  @override
  Future<void> write(T token) async => _credential = token;
}
