// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dio.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authDioHash() => r'9f08e99da01bda4654298bf56aaefa663b17e730';

/// This Dio instance is reserved to the data source of authentication services.
/// This instance doesn't have authentication interceptors because:
/// - it will casuse a circular dependency (this is to be used by the authentication feature)
/// - it doesn't need it (because this is for authentication it doesn't make
/// sense to send a auth header in the requests)
/// For other instance check the [dio]
///
/// Copied from [authDio].
@ProviderFor(authDio)
final authDioProvider = Provider<Dio>.internal(
  authDio,
  name: r'authDioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authDioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthDioRef = ProviderRef<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
