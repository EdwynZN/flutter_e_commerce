import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widget/page_indicator.dart';
import 'package:flutter_e_commerce/features/products/application/controller/single_product_provider.dart';
import 'package:flutter_e_commerce/features/products/application/widget/price_container.dart';
import 'package:flutter_e_commerce/features/products/application/widget/thumb_image.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/utils/constraints.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductScreen extends HookConsumerWidget {
  final int id;

  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageKey = useRef(const PageStorageKey('product_images'));
    final pageController = usePageController(viewportFraction: 0.8);
    final lookup = ref.watch(productProvider(id: id));
    final list = lookup.when(
      loading: () => const [
        SliverToBoxAdapter(child: LinearProgressIndicator()),
      ],
      error: (error, stackTrace) {
        return const [
          SliverToBoxAdapter(),
        ];
      },
      data: (data) {
        final hasImages = data.images.isNotEmpty;
        return [
          SliverList.list(
            children: [
              if (hasImages)
                _ProductImagePageViewer(
                  productImages: data.images,
                  pageKey: pageKey.value,
                  pageController: pageController,
                ),
              gap8,
              Center(child: PriceChip(price: data.price)),
              if (hasImages && data.images.length > 1) ...[
                gap12,
                PageIndicator(
                  controller: pageController,
                  count: data.images.length,
                ),
              ],
              const Divider(height: 48.0, indent: 16.0, endIndent: 16.0),
              if (data.description != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    data.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.2,
                      wordSpacing: 0.25,
                    ),
                  ),
                ),
              gap32,
            ],
          ),
        ];
      },
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            elevation: 4.0,
            pinned: true,
            title: lookup.maybeWhen(
              skipLoadingOnReload: true,
              data: (d) => Text(d.title),
              orElse: () => null,
            ),
          ),
          ...list,
        ],
      ),
    );
  }
}

class _ProductImagePageViewer extends StatelessWidget {
  final List<ProductImage> productImages;

  const _ProductImagePageViewer({
    // ignore: unused_element
    super.key,
    required this.pageKey,
    required this.pageController,
    required this.productImages,
  });

  final PageStorageKey<String> pageKey;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: PageView.builder(
        key: pageKey,
        controller: pageController,
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: ThumbImage(
                alignment: Alignment.center,
                addInk: false,
                fit: BoxFit.scaleDown,
                imageUrl: productImages[index].image,
              ),
            ),
          );
        },
      ),
    );
  }
}
