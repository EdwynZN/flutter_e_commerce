import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* ref.listen(
      authServiceProvider,
      (_, curr) {
        final String? route = curr.maybeWhen(
          skipError: false,
          skipLoadingOnRefresh: false,
          skipLoadingOnReload: false,
          data: (d) => d is NoSession ? RouteName.login : RouteName.products,
          error: (_, __) => RouteName.login,
          orElse: () => null,
        );
        if (route != null) {
          Future.microtask(
            () => context.pushReplacementNamed(route),
          );
        }
      },
    ); */
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
