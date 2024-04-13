import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/domain/exception/auth_exception.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/jwt_decoder_service.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';

abstract class AuthenticationService<T extends Session> {
  /// The currently logged in user or null
  User? get currentUser;

  /// Read a copy of the user session.
  ///
  /// You should not use this getter to determinate the users current state,
  /// instead use stream to subscribe to updates.
  T? get session;

  // Run it to initiliaze authentication.
  //
  // Check local storage, credentials, previous created tokens or refresh tokens
  //
  // Use it only once
  @protected
  Future<T> initializeApp();

  /// Login with credentials to return and save a JWT
  Future<void> loginWithCredential(Credential credential);

  /// Call logout in the repository and change the AuthToken to null
  /// regardless the response of the server
  Future<void> logout();

  /// Refresh the token using the current JWT,
  /// this function ought to be called only when the user is logged.
  /// State is modified with the new token
  Future<void> refreshToken();

  /// Signup user
  Future<void> signUpUser(Credential credential);
}

class AuthenticatorInterceptor<T extends Session> extends QueuedInterceptor {
  final JWTValidator validator;
  final AuthenticationService<T> authService;

  AuthenticatorInterceptor(this.authService, this.validator);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    OAuth? getOAuth(AuthenticationService<T> auth) {
      return switch (authService.session) {
        OAuthSession(oAuth: final oAuth) => oAuth,
        NoSession() || null => null,
      };
    }

    OAuth? oAuth = getOAuth(authService);
    if (oAuth == null) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          error: const CredentialFailure(),
        ),
      );
    } else if (oAuth.refreshToken != null && validator.hasExpired(oAuth)) {
      try {
        await authService.refreshToken();
        OAuth? oAuth = getOAuth(authService);
        if (oAuth == null) {
          return handler.reject(
            DioException(
              requestOptions: options,
              type: DioExceptionType.unknown,
              error: const CredentialFailure(),
            ),
          );
        }
      } on DioException catch (error) {
        return handler.reject(error);
      }
    }
    options.headers
        .putIfAbsent(HttpHeaders.authorizationHeader, () => oAuth.header);
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    /// If there is a 401 response, then we should logout the user
    if (err.type == DioExceptionType.badResponse &&
        err.response!.statusCode == 401) {
      authService.logout();
      return super.onError(
        err.copyWith(
          error: const TokenFailure.unauthorized(message: 'unauthorized'),
        ),
        handler,
      );
    }
    return super.onError(err, handler);
  }
}
