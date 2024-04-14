import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/cart/application/controller/cart_provider.dart';
import 'package:flutter_e_commerce/features/cart/application/widget/list_cart_tile.dart';
import 'package:flutter_e_commerce/utils/fade_slide_configuration.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  Future<bool?> _clearCartDialog(BuildContext context) {
    return showModal<bool>(
      context: context,
      configuration: const FadeSlideConfiguration(
        barrierColor: Colors.black45,
        barrierDismissible: true,
      ),
      useRootNavigator: false,
      builder: (context) {
        final theme = Theme.of(context);
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          alignment: Alignment.bottomCenter,
          title: const Text('Clear cart?'),
          contentTextStyle: theme.textTheme.titleMedium,
          content: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 400),
            child: const Text('This action cannot be undone'),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
              ),
              onPressed: () => Navigator.maybePop(context, false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.maybePop(context, true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider);
    final isEmpty = cart.maybeWhen(
      orElse: () => true,
      data: (data) => data.items.isEmpty,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton.filled(
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: isEmpty ? null : () async {
              final bool? result = await _clearCartDialog(context);
              if (result == null || !result) {
                return;
              }
              ref.read(cartControllerProvider.notifier).clearCart();
            },
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Clear cart',
          ),
        ],
      ),
      body: cart.when(
        loading: () => const LinearProgressIndicator(),
        error: (_, __) => const Center(child: Text('Error')),
        data: (data) {
          final items = data.items;
          return ListView.separated(
            itemCount: data.items.length,
            separatorBuilder: (_, __) => const Divider(
              endIndent: 16.0,
              indent: 16.0,
            ),
            itemBuilder: (context, index) {
              return ListCartTile(item: items[index]);
            },
          );
        },
      ),
    );
  }
}
