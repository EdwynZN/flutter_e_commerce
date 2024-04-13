import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/auth_service.dart';
import 'package:flutter_e_commerce/features/authentication/domain/service/jwt_decoder_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
JWTValidator jwtValidator(JwtValidatorRef ref) => JWTValidator(JwtDecoder());

@Riverpod(keepAlive: true)
BaseOptions dioOptions(DioOptionsRef ref) => BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
    listFormat: ListFormat.multi,
    followRedirects: true,
    headers: <String, dynamic>{"X-Requested-With": "XMLHttpRequest"},
  );

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final options = ref.watch(dioOptionsProvider);
  final Dio dio = Dio(options);
  final authService = ref.watch(authServiceProvider.notifier);
  final validator = ref.watch(jwtValidatorProvider);

  ref.onDispose(dio.close);

  return dio
    ..interceptors.addAll([AuthenticatorInterceptor(authService, validator)]);
}
