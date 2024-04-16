import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widget/avatar_user.dart';
import 'package:flutter_e_commerce/common/widget/cart_icon.dart';
import 'package:flutter_e_commerce/features/products/application/controller/item_products_provider.dart';
import 'package:flutter_e_commerce/features/products/application/controller/products_provider.dart';
import 'package:flutter_e_commerce/features/products/application/widget/product_tile.dart';
import 'package:flutter_e_commerce/features/products/application/widget/search_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// hook to read the scroll controller and notify the productNotifier that can
/// try to fetch the next page if:
///   - is not in a loading state
///   - the remaining scrolling space is less that [viewportFactor] * viewportDimension (which usally is the height device)
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
      body: Scrollbar(
        controller: scrollController,
        child: RefreshIndicator(
          onRefresh: () => ref.read(productNotifierProvider.notifier).refresh(),
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
                          ? BackButtonListener(
                              onBackButtonPressed: () async {
                                searchListenable.value = false;
                                return true;
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
                          productNotifierProvider.select((value) =>
                              value.isRefreshing || value.isReloading));
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
            child: Text(
              'Error fecthing products',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
      data: (_) {
        /// after knowing productNotifierProvider has valid data we can read
        /// itemsPaginationProvider to combine that data with the cart items and get
        /// a list of items with more information
        final data = ref.watch(itemsPaginationProvider);
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
              return ProductTile(item: data[index]);
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
