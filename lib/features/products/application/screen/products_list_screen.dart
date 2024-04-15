import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widget/avatar_user.dart';
import 'package:flutter_e_commerce/common/widget/cart_icon.dart';
import 'package:flutter_e_commerce/features/products/application/controller/products_provider.dart';
import 'package:flutter_e_commerce/features/products/application/widget/product_tile.dart';
import 'package:flutter_e_commerce/features/products/application/widget/search_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void _usePagination({
  required ProductNotifier pagingController,
  required ScrollController scrollController,
  double viewportFactor = 0.5,
}) {
  useEffect(() {
    void listenScroll() {
      final position = scrollController.position;
      if (!pagingController.isLoading &&
          position.extentAfter <
              (position.viewportDimension * viewportFactor)) {
        pagingController.nextPage();
      }
    }

    scrollController.addListener(listenScroll);
    return () => scrollController.removeListener(listenScroll);
  }, [scrollController, pagingController]);
}

class ProductListScreen extends HookConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNotifier = ref.watch(productNotifierProvider.notifier);
    final scrollController = useScrollController();
    final searchListenable = useValueNotifier(false);
    _usePagination(
      pagingController: productNotifier,
      scrollController: scrollController,
    );
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(productNotifierProvider.notifier).refresh(),
        child: Scrollbar(
          controller: scrollController,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const UserAvatar(),
                title: HookBuilder(
                  builder: (context) {
                    final isSearch = useValueListenable(searchListenable);
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: isSearch
                          ? PopScope(
                              canPop: false,
                              onPopInvoked: (canPop) {
                                if (canPop) {
                                  return;
                                }
                                searchListenable.value = false;
                              },
                              child: const ProductSearchBar(),
                            )
                          : const Text('Products'),
                    );
                  },
                ),
                actions: [
                  IconButton(
                    tooltip: 'Search',
                    onPressed: () {
                      searchListenable.value = !searchListenable.value;
                    },
                    icon: SearchButton(notifier: searchListenable),
                  ),
                  const CartIcon(),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(24.0),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final isRefreshing = ref.watch(
                        productNotifierProvider
                        .select((value) => value.isRefreshing)
                      );
                      if (isRefreshing) {
                        return const LinearProgressIndicator(minHeight: 2);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
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
      error: (_, __) => SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: Center(
          child: TextButton(
            onPressed: () => ref.invalidate(productNotifierProvider),
            child: Text('Error fecthing products',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ),
        ),
      ),
      data: (data) {
        if (data.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: Center(
              child: Text(
                '0 products matched',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          );
        }
        return SliverList.builder(
          itemBuilder: (context, index) {
            if (index < data.length) {
              return ProductTile(product: data[index]);
            } else if (index == data.length && asyncProducts.isLoading) {
              return const LinearProgressIndicator();
            }
            return null;
          },
        );
      },
    );
  }
}
