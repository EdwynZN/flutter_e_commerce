import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/products/application/controller/filter_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void _useDebounceSearch(
  TextEditingController controller,
  FilterNotifier provider, [
  Duration duration = const Duration(milliseconds: 500),
]) {
  useEffect(() {
    Timer? timer;

    void listener() {
      timer?.cancel();
      timer = Timer(duration, () {
        provider.changeSearch(controller.text);
      });
    }

    controller.addListener(listener);
    return () {
      timer?.cancel();
      controller.removeListener(listener);
      Future.microtask(() => provider.changeSearch(''));
    };
  }, [controller, provider]);
}

class ProductSearchBar extends HookConsumerWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(filterNotifierProvider.notifier);
    final textController = useTextEditingController(
      text: provider.initial,
    );
    _useDebounceSearch(textController, provider);
    return TextField(
      autofocus: true,
      controller: textController,
      decoration: InputDecoration(
        hintText: 'Search product...',
        border: InputBorder.none,
        suffixIcon: IconButton(
          iconSize: 16.0,
          onPressed: () => textController.clear(),
          icon: const Icon(Icons.clear),
          tooltip: 'Clear',
        ),
      ),
    );
  }
}

class SearchButton extends HookConsumerWidget {
  final ValueNotifier<bool> notifier;

  const SearchButton({super.key, required this.notifier});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animation = useAnimationController(
      duration: const Duration(milliseconds: 400),
      initialValue: notifier.value ? 1 : 0,
    );
    useEffect(() {
      void updateAnimation() {
        notifier.value ? animation.forward() : animation.reverse();
      }

      notifier.addListener(updateAnimation);

      return () => notifier.removeListener(updateAnimation);
    }, [notifier, animation]);

    return AnimatedIcon(
      icon: AnimatedIcons.search_ellipsis,
      progress: animation,
    );
  }
}
