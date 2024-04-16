import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:flutter_e_commerce/utils/num_extensions.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:go_router/go_router.dart';

class ListCartTile extends StatelessWidget {
  final PurchasedItem item;

  const ListCartTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final price = item.price.thousandSeparator(decimalPad: 2);
    final q = item.quantity;
    final subtitle = 'Item'.toCountString(q);
    return ListTile(
      title: Text(item.product.name, maxLines: 2),
      subtitle: Text(subtitle, maxLines: 1),
      trailing: Text(
        '\$$price',
        maxLines: 1,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        context.pushNamed(
          RouteName.productDetails,
          pathParameters: {'id': item.product.id.toString()},
        );
      },
    );
  }
}
