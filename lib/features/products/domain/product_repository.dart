import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product_filter_options.dart';
import 'package:flutter_e_commerce/shared/model/pagination.dart';

abstract interface class ProductRepository {

  Future<List<Product>> page({
    ProductFilterOptions? filter,
    Pagination pagination,
  });

  Future<Product> detail({required int id});
}
