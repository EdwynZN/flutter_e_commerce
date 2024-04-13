import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/screen/splash.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/application/screen/login.dart';
import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
import 'package:flutter_e_commerce/features/products/application/screen/products_list_screen.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

enum _SessionEnum { isLoggedIn, needsAuth }

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final listenable = ValueNotifier<_SessionEnum?>(null);

  ref.listen(
    authServiceProvider,
    (previous, next) {
      listenable.value = next.maybeMap(
        data: (data) => switch (data.value) {
          NoSession() => _SessionEnum.needsAuth,
          OAuthSession() => _SessionEnum.isLoggedIn,
        },
        error: (error) =>
            error.hasValue ? listenable.value : _SessionEnum.needsAuth,
        orElse: () => listenable.value,
      );
    },
  );

  ref.onDispose(listenable.dispose);
  return GoRouter(
    refreshListenable: listenable,
    debugLogDiagnostics: false,
    errorBuilder: (_, __) => const Material(),
    routerNeglect: false,
    initialLocation: '/',
    observers: const [],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) {
          final session = listenable.value;
          if (session == null) {
            return null;
          }
          final path = state.uri.path;
          return switch (session) {
            _SessionEnum.needsAuth =>
              path.startsWith('/auth') ? null : '/auth/sign-in',
            _SessionEnum.isLoggedIn =>
              path.startsWith('/auth') ? '/home/products' : null,
          };
        },
        routes: [
          ShellRoute(
            builder: (context, state, child) => child,
            routes: [
              GoRoute(
                path: 'auth/sign-in',
                name: RouteName.login,
                builder: (context, state) => const LoginScreen(),
              ),
              GoRoute(
                path: 'auth/sign-up',
                name: RouteName.signup,
                builder: (context, state) => const Material(),
              ),
            ],
          ),
          GoRoute(
            path: 'home/products',
            name: RouteName.products,
            builder: (context, state) => const ProductListScreen(),
            routes: [
              GoRoute(
                path: ':id',
                name: RouteName.productDetails,
                builder: (context, state) => const Material(),
              ),
            ],
          ),
          GoRoute(
            path: 'home/cart',
            name: RouteName.cart,
            builder: (context, state) => const Material(),
          ),
        ],
      ),
    ],
  );
}
