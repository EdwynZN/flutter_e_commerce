import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product_filter_options.dart';

abstract interface class ProductRepository {
  Future<List<Product>> all({ProductFilterOptions? filter});

  Future<Product?> detail({required int id});
}
