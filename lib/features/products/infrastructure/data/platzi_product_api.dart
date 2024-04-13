import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/shared/dio_provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'platzi_product_api.g.dart';

@riverpod
PlatziProductsApi platziProductsApi(PlatziProductsApiRef ref) {
  final dio = ref.watch(dioProvider);
  return PlatziProductsApi(dio);
}

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1/products')
abstract class PlatziProductsApi {
  factory PlatziProductsApi(Dio dio, {String baseUrl}) = _PlatziProductsApi;

  @GET('')
  Future<List<Product>> getProducts({
    @Query('title') String? title,
    @Query('price_min') int? minParice,
    @Query('price_max') int? maxParice,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET('/{id}')
  Future<Product?> product({
    @Path('id') required int id,
    @CancelRequest() CancelToken? cancelToken,
  });
}
