import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widget/tonal_card.dart';
import 'package:flutter_e_commerce/common/widget/vertical_button.dart';
import 'package:flutter_e_commerce/features/cart/application/controller/cart_provider.dart';
import 'package:flutter_e_commerce/features/products/application/controller/single_product_provider.dart';
import 'package:flutter_e_commerce/features/products/application/model/item.dart';
import 'package:flutter_e_commerce/utils/fade_slide_configuration.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartCard extends ConsumerWidget {
  final int productId;

  const CartCard({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(id: productId));
    final ({
      IconData icon,
      String title,
      Item? item,
    }) attr = item.when(
      loading: () => (
        icon: Icons.shopping_cart_outlined,
        title: 'loading...',
        item: null,
      ),
      error: (_, __) => (icon: Icons.error, title: '', item: null),
      data: (data) => (
        icon: data.quantity == 0
            ? Icons.shopping_cart_outlined
            : Icons.shopping_cart,
        title: data.quantity == 0
            ? 'Add to cart'
            : 'Item'.toCountString(data.quantity),
        item: data,
      ),
    );
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 90.0),
      child: TonalCard(
        elevation: 4.0,
        clipBehavior: Clip.hardEdge,
        child: ColumnButton(
          icon: attr.icon,
          title: attr.title,
          onPressed: attr.item == null
              ? null
              : () {
                  showModal(
                    context: context,
                    configuration: const FadeSlideConfiguration(
                      barrierColor: Colors.black38,
                      barrierDismissible: true,
                    ),
                    useRootNavigator: false,
                    builder: (context) => _CartDialog(item: attr.item!),
                  );
                },
        ),
      ),
    );
  }
}

class _CartDialog extends HookConsumerWidget {
  final Item item;

  // ignore: unused_element
  const _CartDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = useState(item.quantity);
    final theme = Theme.of(context);
    final foregroundDeleteColor = theme.colorScheme.onErrorContainer;
    final backgroundDeleteColor = theme.colorScheme.errorContainer;
    final foregroundEditColor = theme.colorScheme.onPrimaryContainer;
    final backgroundEditColor = theme.colorScheme.primaryContainer;
    final materialPadding = MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
    );
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      title: const Text(
        'Item',
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
      titleTextStyle: theme.textTheme.headlineSmall,
      buttonPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      actionsPadding: const EdgeInsets.fromLTRB(
        24.0,
        0.0,
        24.0,
        12.0,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 24.0,
        horizontal: 16.0,
      ),
      actionsAlignment: MainAxisAlignment.end,
      content: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 360.0),
        child: SegmentedButton(
          emptySelectionAllowed: true,
          selected: const <int>{},
          segments: [
            ButtonSegment<int>(
              value: -1,
              enabled: quantity.value > 0,
              icon: const Icon(Icons.remove),
            ),
            ButtonSegment<int>(
              value: 0,
              enabled: false,
              tooltip: quantity.value.toString(),
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  quantity.value.toString(),
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            const ButtonSegment<int>(value: 1, icon: Icon(Icons.add)),
          ],
          onSelectionChanged: (set) {
            if (set.contains(-1)) {
              quantity.value--;
            } else if (set.contains(1)) {
              quantity.value++;
            }
          },
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundDeleteColor),
            foregroundColor: MaterialStatePropertyAll(foregroundDeleteColor),
            padding: materialPadding,
            shape: const MaterialStatePropertyAll(StadiumBorder()),
            visualDensity: const VisualDensity(horizontal: 3.0),
          ),
          onPressed: () {
            ref.read(cartControllerProvider.notifier).addProduct(
                  product: item.product,
                  quantity: 0,
                );
            Navigator.maybePop(context);
          },
          child: const Text('Remove'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundEditColor),
            foregroundColor: MaterialStatePropertyAll(foregroundEditColor),
            padding: materialPadding,
            visualDensity: const VisualDensity(horizontal: 4.0),
            shape: const MaterialStatePropertyAll(StadiumBorder()),
          ),
          onPressed: () {
            ref.read(cartControllerProvider.notifier).addProduct(
                  product: item.product,
                  quantity: quantity.value,
                );
            Navigator.maybePop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
