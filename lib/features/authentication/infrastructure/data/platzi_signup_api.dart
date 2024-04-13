import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'platzi_signup_api.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1/users')
abstract class PlatziSignUpApi {
  factory PlatziSignUpApi(Dio dio, {String baseUrl}) = _PlatziSignUpApi;

  @POST('')
  Future<User> createUser({
    @Body() required Map<String, dynamic> credential,
    @CancelRequest() CancelToken? cancelToken,
  });
}
