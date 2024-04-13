import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final String? description = product.description;
    return ListTile(
      title: Text(product.title),
      subtitle: description == null
        ? null
        : Text(
          description,
          maxLines: 1,
        ),
    );
  }
}
