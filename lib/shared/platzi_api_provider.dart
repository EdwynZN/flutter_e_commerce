import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/products/infrastructure/data/platzi_product_api.dart';
import 'package:flutter_e_commerce/shared/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'platzi_api_provider.g.dart';

@Riverpod(keepAlive: true)
PlatziApi platziApi(PlatziApiRef ref) {
  return PlatziApi(dio: ref.watch(dioProvider));
}

class PlatziApi {
  final PlatziProductsApi productsApi;

  PlatziApi._({
    required this.productsApi,
  });

  @visibleForTesting
  PlatziApi.test({required this.productsApi});

  factory PlatziApi({required Dio dio}) {
    return PlatziApi._(
      productsApi: PlatziProductsApi(dio),
    );
  }
}
