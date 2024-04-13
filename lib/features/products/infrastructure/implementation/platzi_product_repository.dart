import 'package:flutter_e_commerce/features/products/infrastructure/data/platzi_product_api.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product_filter_options.dart';
import 'package:flutter_e_commerce/features/products/domain/product_repository.dart';

class PlatziProductRepository implements ProductRepository {
  final PlatziProductsApi _api;

  PlatziProductRepository({required PlatziProductsApi api}) : _api = api;

  @override
  Future<List<Product>> all({ProductFilterOptions? filter}) {
    return _api.getProducts(title: filter?.title);
  }

  @override
  Future<Product?> detail({required int id}) {
    return _api.product(id: id);
  }
}
