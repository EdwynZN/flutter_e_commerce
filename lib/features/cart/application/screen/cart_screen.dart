import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/cart/application/controller/cart_provider.dart';
import 'package:flutter_e_commerce/utils/num_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: const [],
      ),
      body: cart.when(
        loading: () => const LinearProgressIndicator(),
        error: (_, __) => const Center(child: Text('Error')),
        data: (data) {
          final items = data.items;
          return ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final price = item.price.thousandSeparator(decimalPad: 2);
              return ListTile(
                title: Text(item.product.name),
                subtitle: Text('\$$price'),
                leading: Text(
                  item.quantity.toString(),
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
