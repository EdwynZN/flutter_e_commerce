import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/hive_local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Class to implement storage of credential token
abstract class AuthenticationLocalStorage<T extends UserCredential> {
  const factory AuthenticationLocalStorage(Box<T> storage) =
      HiveAuthenticationStorage;

  /// Returns the stored token (if any) asynchronously.
  Future<T?> read();

  /// Saves the provided [token] asynchronously.
  Future<void> write(T token);

  /// Deletes the stored token asynchronously.
  Future<void> delete();
}
