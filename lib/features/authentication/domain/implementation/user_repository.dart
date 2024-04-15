import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/features/authentication/domain/exception/user_exception.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/auth_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user_info.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_local_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/user_repository.dart';
import 'package:flutter_e_commerce/features/authentication/infrastructure/data/platzi_user_api.dart';
import 'package:flutter_e_commerce/shared/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
PlatziUserApi platziUserApi(PlatziUserApiRef ref) {
  final options = ref.watch(dioOptionsProvider);
  final Dio dio = Dio(options);
  final userApi = PlatziUserApi(dio);
  ref.onDispose(dio.close);
  return userApi;
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  final userApi = ref.watch(platziUserApiProvider);
  final localStorage = ref.watch(credentialLocalStorageProvider);
  return UserRepositoryImpl(localStorage, userApi);
}

class UserRepositoryImpl implements UserRepository {
  final AuthenticationLocalStorage _localStorage;
  final PlatziUserApi _userApi;

  const UserRepositoryImpl(this._localStorage, this._userApi);

  @override
  Future<User> createUser(UserInfo user) async {
    final checkAvailability = await exists(user.email);
    if (!checkAvailability) {
      throw UserAvailableException(
        email: user.email,
        stackTrace: StackTrace.current,
      );
    }
    final createdUser = await _userApi.createUser(newUserInfo: user);
    final credential = Credential(email: user.email, password: user.password);
    await _localStorage.write(UserCredential(credential: credential));
    return createdUser;
  }

  @override
  Future<bool> exists(String email) async {
    final userAvailable = await _userApi.checkAvailability(
      email: {'email': email},
    );
    return userAvailable.isAvailable;
  }
}
