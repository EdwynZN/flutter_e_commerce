@TestOn('vm')
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/cart/application/controller/cart_provider.dart';
import 'package:flutter_e_commerce/features/cart/application/screen/cart_screen.dart';
import 'package:flutter_e_commerce/features/cart/application/widget/list_cart_tile.dart';
import 'package:flutter_e_commerce/features/cart/domain/model/cart.dart';
import 'package:flutter_e_commerce/shared/hive_boxes_name.dart';
import 'package:flutter_e_commerce/shared/theme.dart';
import 'package:flutter_e_commerce/utils/hive_initializer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  const testPath = '/test/cart';
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'test cart screen: ',
    () {
      late ProviderContainer container;

      setUpAll(() {
        WidgetsFlutterBinding.ensureInitialized();
        final dir = Directory.current;
        final path = dir.path + testPath;
        final hiveFile = File('$path/$cartBox.hive');
        final lockFile = File('$path/$cartBox.lock');
        if (hiveFile.existsSync()) {
          hiveFile.deleteSync();
        }
        if (lockFile.existsSync()) {
          lockFile.deleteSync();
        }
        initDartHive(path);
      });

      tearDown(() async {
        container.dispose();
        await Hive.deleteFromDisk();
        await Hive.close();
      });

      testWidgets('cart filled with products', (WidgetTester tester) async {
        tester.view.physicalSize = const Size(640, 950);
        tester.view.devicePixelRatio = 1;

        final box =
            await tester.runAsync(() => Hive.openBox<PurchasedItem>(cartBox));
        const double price = 100;
        const quantity = 5;
        const items = 10;
        await tester.runAsync(
          () => box!.addAll(
            List.generate(
              items,
              (index) => PurchasedItem(
                id: index + 1,
                price: price,
                quantity: quantity,
                product: ItemProduct(id: index, name: 'Product $index'),
              ),
            ),
          ),
        );

        container = ProviderContainer();

        /// Just pump the cart screen widget, no router (and no auth)
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: Consumer(
              builder: (context, ref, child) {
                final themeFlex = ref.watch(themeProvider);
                return MaterialApp(
                  theme: themeFlex.light,
                  darkTheme: themeFlex.dark,
                  home: const CartScreen(),
                );
              },
            ),
          ),
        );
        await tester.pumpAndSettle(const Duration(milliseconds: 400));

        /// check if cart has all the data from the previous hive initialization
        expect(
          container.read(cartControllerProvider),
          isA<AsyncData<Cart>>()
              .having(
                (p0) => p0.value,
                'cart',
                isA<Cart>()
                    .having((p0) => p0.total, 'total',
                        equals(items * quantity * price))
                    .having((p0) => p0.items, 'items', hasLength(10)),
              )
              .having((p0) => p0.isLoading, 'isLoading', isFalse),
        );

        final itemWidgets = find.bySubtype<ListCartTile>();
        expect(itemWidgets, findsAtLeastNWidgets(10));

      });
    },
  );
}
