import 'package:flutter_e_commerce/shared/model/domain_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

sealed class AuthException implements DomainException {
  final String message;

  const AuthException(this.message);
}

@freezed
sealed class TokenFailure extends AuthException with _$TokenFailure {
  const factory TokenFailure.unauthorized({
    required final String message,
    @Default(StackTrace.empty) final StackTrace stackTrace,
  }) = UnauthorizedTokenFailure;
}

@freezed
sealed class CredentialFailure extends AuthException with _$CredentialFailure {
  const factory CredentialFailure.refresh({
    @Default('no refresh token') final String message,
    @Default(StackTrace.empty) final StackTrace stackTrace,
  }) = RefreshCredentialFailure;

  const factory CredentialFailure({
    @Default('invalid credentials') final String message,
    @Default(StackTrace.empty) final StackTrace stackTrace,
  }) = EmailCredentialFailure;
}
