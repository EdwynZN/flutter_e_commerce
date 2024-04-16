import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/shared/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_dio.g.dart';

/// This Dio instance is reserved to the data source of authentication services.
/// This instance doesn't have authentication interceptors because:
/// - it will casuse a circular dependency (this is to be used by the authentication feature)
/// - it doesn't need it (because this is for authentication it doesn't make 
/// sense to send a auth header in the requests)
/// For other instance check the [dio]
@Riverpod(keepAlive: true)
Dio authDio(AuthDioRef ref) {
  final options = ref.watch(dioOptionsProvider);
  final Dio dio = Dio(options);
  ref.onDispose(dio.close);
  return dio;
}