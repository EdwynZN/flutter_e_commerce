// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$platziUserApiHash() => r'1b0448fb89e6f1930aae289ffd66fc15c314691a';

/// See also [platziUserApi].
@ProviderFor(platziUserApi)
final platziUserApiProvider = Provider<PlatziAuthApi>.internal(
  platziUserApi,
  name: r'platziUserApiProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$platziUserApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlatziUserApiRef = ProviderRef<PlatziAuthApi>;
String _$credentialLocalStorageHash() =>
    r'f4a127eaeb3988cb354c0b8a8ba6adccc1c421a9';

/// See also [credentialLocalStorage].
@ProviderFor(credentialLocalStorage)
final credentialLocalStorageProvider =
    Provider<AuthenticationLocalStorage>.internal(
  credentialLocalStorage,
  name: r'credentialLocalStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$credentialLocalStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CredentialLocalStorageRef = ProviderRef<AuthenticationLocalStorage>;
String _$authRepositoryHash() => r'90676a00644dfa0dddb15ca1812cce203a16f693';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthenticationRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = ProviderRef<AuthenticationRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
