import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user_info.dart';
import 'package:flutter_e_commerce/features/authentication/infrastructure/model/user_available.dart';
import 'package:retrofit/retrofit.dart';

part 'platzi_user_api.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1/users')
abstract class PlatziUserApi {
  factory PlatziUserApi(Dio dio, {String baseUrl}) = _PlatziUserApi;

  @POST('/is-available')
  Future<UserAvailable> checkAvailability({
    @Body() required Map<String, dynamic> email,
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('')
  Future<User> createUser({
    @Body() required UserInfo newUserInfo,
    @CancelRequest() CancelToken? cancelToken,
  });
}
