import 'dart:async';

import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user_info.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_service.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/auth_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/sign_up_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthService extends AsyncNotifier<Session>
    implements AuthenticationService<Session> {
  late AuthenticationRepository _authRepository;
  late SignUpUseCase _signUpUseCase;
  Completer<UserCredential>? _completer;

  @override
  Future<Session> build() async {
    _authRepository = ref.watch(authRepositoryProvider);
    _signUpUseCase = ref.watch(signUpUseCaseProvider);
    return initializeApp();
  }

  @override
  User? get currentUser => _getOAuthSession?.userInfo;

  @override
  Session? get session =>
      state.maybeWhen(orElse: () => null, data: (data) => data);

  OAuthSession? get _getOAuthSession => switch (session) {
        OAuthSession() => this as OAuthSession,
        NoSession() || null => null,
      };

  @override
  Future<Session> initializeApp() async {
    final localStorage = ref.read(credentialLocalStorageProvider);
    final userCredential = await localStorage.read();
    if (userCredential == null) {
      return const NoSession();
    } else if (userCredential.oAuth == null) {
      return NoSession(credential: userCredential.credential);
    }
    try {
      final user = await _authRepository.getUserInfo();
      return Session(
        oAuth: userCredential.oAuth!,
        userInfo: user,
        credential: userCredential.credential,
      );
    } catch (_) {
      return NoSession(credential: userCredential.credential);
    }
  }

  Future<AsyncValue<Session>> _loginWithCredential(
      Credential credential) async {
    final AsyncValue<Session> response = await AsyncValue.guard(() async {
      final oAuth = await _authRepository.login(credential);
      final user = await _authRepository.getUserInfo();

      return Session(oAuth: oAuth, userInfo: user, credential: credential);
    });
    return response;
  }

  @override
  Future<void> loginWithCredential(Credential credential) async {
    if (state is! AsyncLoading) {
      state = const AsyncLoading();
    }
    state = const AsyncLoading();
    final AsyncValue<Session> response = await _loginWithCredential(credential);
    state = response;
  }

  @override
  Future<void> logout() async {
    // There is no current session
    if (state is! AsyncData<Session>) return;
    try {
      await _authRepository.logout();
    } finally {
      final credential = state.maybeWhen(
        skipError: true,
        skipLoadingOnRefresh: true,
        data: (data) => data.credential,
        orElse: () => null,
      );
      state = AsyncData(NoSession(credential: credential));
    }
  }

  @override
  Future<void> refreshToken() async {
    // if there is no session it shouldn't try to get a new token
    final OAuthSession session;
    if (state case AsyncValue<Session>(value: final value)
        when value != null && value is OAuthSession) {
      session = value;
    } else {
      return;
    }
    if (_completer != null && _completer!.isCompleted) _completer = null;
    final refreshToken = _getOAuthSession?.oAuth.refreshToken;
    if (_completer == null && refreshToken != null) {
      _completer = Completer();
      _completer!.complete(_authRepository.refresh());
      final userCredential = await _completer!.future;
      state = AsyncData<Session>(
        userCredential.oAuth == null
            ? NoSession(credential: userCredential.credential)
            : session.copyWith(
                oAuth: userCredential.oAuth!,
                credential: userCredential.credential,
              ),
      );
    } else if (_completer != null) {
      await _completer!.future;
    }
  }

  @override
  Future<void> signUpUser(UserInfo newUser) async {
    if (state.isLoading) {
      return;
    }
    state = const AsyncLoading<Session>();
    final newState = await AsyncValue.guard(() => _signUpUseCase.signupUser(newUser));
    state = newState;
  }
}
