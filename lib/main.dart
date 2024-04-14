import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/routing/router_provider.dart';
import 'package:flutter_e_commerce/utils/hive_initializer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      builder: (context, child) => _Unfocus(child: child),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    // ignore: unused_element
    super.key,
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: child,
    );
  }
}
