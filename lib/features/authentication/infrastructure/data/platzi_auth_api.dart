import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'platzi_auth_api.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1')
abstract class PlatziUserApi {
  factory PlatziUserApi(Dio dio, {String baseUrl}) = _PlatziUserApi;

  @POST('/auth/login')
  Future<OAuth> login({
    @Body() required Map<String, dynamic> credential,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/auth/refresh')
  Future<OAuth> refresh({
    @Body() required Map<String, dynamic> refresh,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/auth/profile')
  Future<User> getUserInfo({
    @Header(HttpHeaders.authorizationHeader) required String authToken,
    @CancelRequest() CancelToken? cancelToken,
  });
}
