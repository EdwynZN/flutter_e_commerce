import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/features/authentication/domain/exception/auth_exception.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_local_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_repository.dart';
import 'package:flutter_e_commerce/features/authentication/infrastructure/data/platzi_auth_api.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/memory_local_storage.dart';
import 'package:flutter_e_commerce/shared/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
PlatziUserApi platziUserApi(PlatziUserApiRef ref) {
  final options = ref.watch(dioOptionsProvider);
  final Dio dio = Dio(options);
  final userApi = PlatziUserApi(dio);
  ref.onDispose(dio.close);
  return userApi;
}

@Riverpod(keepAlive: true)
AuthenticationLocalStorage credentialLocalStorage(
  CredentialLocalStorageRef ref,
) => MemAuthenticationStorage();

@Riverpod(keepAlive: true)
AuthenticationRepository authRepository(AuthRepositoryRef ref) {
  final userApi = ref.watch(platziUserApiProvider);
  final localStorage = ref.watch(credentialLocalStorageProvider);
  return AuthRepositoryImpl(localStorage, userApi);
}

class AuthRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalStorage _localStorage;
  final PlatziUserApi _userApi;

  const AuthRepositoryImpl(this._localStorage, this._userApi);

  @override
  Future<User> getUserInfo() async {
    final credentials = await _localStorage.read();
    final oAuth = credentials?.oAuth;
    if (oAuth == null) {
      throw TokenFailure.unauthorized(
        message: 'no token',
        stackTrace: StackTrace.current,
      );
    }
    final user = await _userApi.getUserInfo(authToken: oAuth.header);
    return user;
  }

  @override
  Future<OAuth> login(Credential credential) async {
    try {
      final oAuth = await _userApi.login(credential: credential.toJson());
      await _localStorage
          .write(UserCredential(credential: credential, oAuth: oAuth));
      return oAuth;
    } on DioException catch (err, s) {
      if (err.type == DioExceptionType.badResponse &&
          err.response!.statusCode == 401) {
        throw CredentialFailure(
          message: 'invalid credentials',
          stackTrace: s,
        );
      }
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    final userCredential = await _localStorage.read();
    if (userCredential != null) {
      Credential credential = userCredential.credential;
      final String? refresh = userCredential.oAuth?.refreshToken;
      credential = refresh == null
          ? userCredential.credential
          : RefreshTokenCredential(
              email: credential.email,
              refreshToken: refresh,
            );
      await _localStorage.write(
        userCredential.copyWith(oAuth: null, credential: credential),
      );
    }
  }

  @override
  Future<UserCredential> refresh() async {
    UserCredential? userCredential = await _localStorage.read();
    if (userCredential == null) {
      throw CredentialFailure(stackTrace: StackTrace.current);
    }
    OAuth? oAuth = userCredential.oAuth;
    final refresh = oAuth?.refreshToken ??
        switch (userCredential.credential) {
          RefreshTokenCredential(refreshToken: final refreshToken) =>
            refreshToken,
          _ => null,
        };
    if (refresh == null) {
      throw RefreshCredentialFailure(stackTrace: StackTrace.current);
    }
    oAuth = await _userApi.refresh(refresh: {"refreshToken": refresh});
    final credential = userCredential.credential;
    userCredential = userCredential.copyWith(
      oAuth: oAuth,
      credential: switch (credential) {
        RefreshTokenCredential() => oAuth.refreshToken != null
            ? credential
            : credential.copyWith(refreshToken: oAuth.refreshToken!),
        _ => credential,
      },
    );
    await _localStorage.write(userCredential);
    return userCredential;
  }
}
