import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/shared/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_dio.g.dart';

@Riverpod(keepAlive: true)
Dio authDio(AuthDioRef ref) {
  final options = ref.watch(dioOptionsProvider);
  final Dio dio = Dio(options);
  ref.onDispose(dio.close);
  return dio;
}