import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/products/application/controller/products_provider.dart';
import 'package:flutter_e_commerce/features/products/application/widget/product_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductListScreen extends HookConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(productNotifierProvider.notifier).refresh(),
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                leading: IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.person_3),
                  tooltip: 'Profile',
                ),
                title: const Text('Products'),
                actions: [
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              const _SliverProductsList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverProductsList extends ConsumerWidget {
  // ignore: unused_element
  const _SliverProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProducts = ref.watch(productNotifierProvider);
    return asyncProducts.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      loading: () => const SliverToBoxAdapter(child: LinearProgressIndicator()),
      error: (_, __) => const SliverToBoxAdapter(),
      data: (data) {
        if (data.isEmpty) {
          return const SliverToBoxAdapter();
        }
        return SliverList.builder(
          itemBuilder: (context, index) {
            if (index < data.length) {
              return ProductTile(product: data[index]);
            }
            return null;
          },
        );
      },
    );
  }
}
