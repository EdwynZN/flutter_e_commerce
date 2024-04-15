import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/products/application/model/item.dart';
import 'package:flutter_e_commerce/features/products/application/widget/no_image_product.dart';
import 'package:flutter_e_commerce/features/products/application/widget/price_container.dart';
import 'package:flutter_e_commerce/features/products/application/widget/thumb_image.dart';
import 'package:flutter_e_commerce/features/products/domain/model/product.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:flutter_e_commerce/utils/constraints.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ProductTile extends StatelessWidget {
  final Item item;

  const ProductTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final product = item.product;
    final insideBody = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            product.title,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.10,
              height: 0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          if (product.description != null) ...[
            gap8,
            Text(
              product.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.0,
                height: 0,
              ),
            ),
          ],
        ],
      ),
    );

    final Widget body = Material(
      type: MaterialType.canvas,
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () {
          context.pushNamed(
            RouteName.productDetails,
            pathParameters: {'id': product.id.toString()},
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              insideBody,
              gap12,
              SizedBox(
                width: 120.0,
                child: _LateralAssetPrice(
                  quantity: item.quantity,
                  price: product.price,
                  image: product.images.firstOrNull,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return InkWell(
      onTap: () {
        context.pushNamed(
          RouteName.productDetails,
          pathParameters: {'id': product.id.toString()},
        );
      },
      child: Column(
        children: [
          body,
          gap4,
          const Divider(height: 12, endIndent: 16.0, indent: 16.0),
        ],
      ),
    );
  }
}

class _LateralAssetPrice extends HookWidget {
  final int quantity;
  final ProductImage? image;
  final double price;

  const _LateralAssetPrice({
    // ignore: unused_element
    super.key,
    required this.price,
    required this.image,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AssetDeal(
          productImage: image,
          quantity: quantity > 1 ? quantity : null,
        ),
        gap8,
        PriceChip(price: price),
      ],
    );
  }
}

class _AssetDeal extends StatelessWidget {
  final int? quantity;
  final ProductImage? productImage;

  // ignore: unused_element
  const _AssetDeal({super.key, this.productImage, this.quantity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final asset = productImage == null
      ? const NoImapePreviewProduct()
      : ThumbImage(
          imageUrl: productImage!.image,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        );
    final Widget child;
    if (quantity == null) {
      child = asset;
    } else {
      child = Stack(
        fit: StackFit.passthrough,
        children: [
          asset,
          Positioned(
            right: 0.0,
            top: 0.0,
            child: CircleAvatar(
              backgroundColor: theme.tertiaryContainer,
              radius: 12.0,
              child: const Icon(Icons.shopping_cart, size: 12.0),
            ),
          ),
        ],
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        height: 70.0,
        width: 120.0,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: ColoredBox(
          color: ElevationOverlay.applySurfaceTint(
            theme.background,
            theme.tertiary,
            2.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
