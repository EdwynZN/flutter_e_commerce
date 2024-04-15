import 'package:flutter_e_commerce/features/authentication/domain/implementation/auth_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/implementation/user_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/credential.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user_info.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_repository.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_service.g.dart';

@Riverpod(keepAlive: true)
SignUpUseCase signUpUseCase(SignUpUseCaseRef ref) {
  final UserRepository userRepository = ref.watch(userRepositoryProvider);
  final AuthenticationRepository authRepository =
      ref.watch(authRepositoryProvider);

  return SignUpUseCase(userRepository, authRepository);
}

class SignUpUseCase {
  final UserRepository _userRepository;
  final AuthenticationRepository _authRepository;

  const SignUpUseCase(this._userRepository, this._authRepository);

  Future<Session> signupUser(UserInfo user) async {
    final userInfo = await _userRepository.createUser(user);
    final credential = Credential(
      email: user.email,
      password: user.password,
    );
    final token = await _authRepository.login(credential);
    return Session(
      oAuth: token,
      credential: credential,
      userInfo: userInfo,
    );
  }
}
