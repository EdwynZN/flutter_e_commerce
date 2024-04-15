import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/cart/application/controller/cart_provider.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool hasItems = ref.watch(cartControllerProvider.select((value) {
      final cart = value.valueOrNull;
      return cart != null && cart.items.isNotEmpty;
    }));
    return IconButton(
      onPressed: () {
        context.pushNamed(RouteName.cart);
      },
      isSelected: hasItems,
      selectedIcon: const Icon(Icons.shopping_cart),
      icon: const Icon(Icons.shopping_cart_outlined),
    );
  }
}
