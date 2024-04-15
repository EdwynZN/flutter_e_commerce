import 'package:flutter_e_commerce/shared/model/domain_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_exception.freezed.dart';

sealed class UserException implements DomainException {
  final String email;

  const UserException(this.email);
}

@freezed
sealed class UserAvailableException extends UserException
    with _$UserAvailableException {
  const factory UserAvailableException({
    required final String email,
    @Default(StackTrace.empty) final StackTrace stackTrace,
  }) = UserAlreadyExistsException;
}
