import 'package:flutter_e_commerce/features/products/domain/exception/product_exception.dart';
import 'package:flutter_e_commerce/features/products/infrastructure/data/platzi_product_api.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product_filter_options.dart';
import 'package:flutter_e_commerce/features/products/domain/product_repository.dart';
import 'package:flutter_e_commerce/shared/model/pagination.dart';

class PlatziProductRepository implements ProductRepository {
  final PlatziProductsApi _api;

  PlatziProductRepository({required PlatziProductsApi api}) : _api = api;

  @override
  Future<List<Product>> page({
    ProductFilterOptions? filter,
    Pagination pagination = const Pagination(),
  }) {
    return _api.getProducts(
      title: filter?.title,
      offset: pagination.offset,
      limit: pagination.limit,
    );
  }

  @override
  Future<Product> detail({required int id}) async {
    final product = await _api.product(id: id);
    if (product == null) {
      throw ProductNotFoundException(id: id);
    }
    return product;
  }
}
