import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/products/application/widget/no_image_product.dart';
import 'package:flutter_e_commerce/shared/cache_manager.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThumbImage extends ConsumerWidget {
  final Alignment alignment;
  final BoxFit fit;
  final bool addInk;
  final String imageUrl;

  const ThumbImage({
    super.key,
    required this.imageUrl,
    this.alignment = Alignment.centerLeft,
    this.fit = BoxFit.fitHeight,
    this.addInk = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      alignment: alignment,
      imageBuilder: !addInk
          ? null
          : (context, imageProvider) => Ink.image(
                image: imageProvider,
                alignment: alignment,
                fit: fit,
              ),
      cacheManager: ref.watch(cacheManagerProvider()),
      errorWidget: (_, __, ___) => const NoImapePreviewProduct(),
      placeholder: (_, __) => const _LoadingAsset(),
    );
  }
}

class _LoadingAsset extends HookWidget {
  // ignore: unused_element
  const _LoadingAsset({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final containerColor = theme.colorScheme.tertiary;
    final initialColor = ElevationOverlay.applySurfaceTint(
      theme.colorScheme.surface,
      containerColor,
      3.0,
    );
    final endColor = ElevationOverlay.applySurfaceTint(
      theme.colorScheme.surface,
      containerColor,
      12.0,
    );
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
      animationBehavior: AnimationBehavior.preserve,
      reverseDuration: const Duration(seconds: 1, milliseconds: 500),
      keys: const [],
    );
    final animColor = useMemoized(
      () => ColorTween(begin: initialColor, end: endColor).animate(controller),
      [controller, initialColor, endColor],
    );
    useEffect(() {
      controller.repeat(reverse: true);
      return;
    }, const []);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) =>
          ColoredBox(color: animColor.value ?? Colors.transparent),
    );
  }
}
