import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/screen/splash.dart';
import 'package:flutter_e_commerce/features/authentication/application/widget/auth_card_wrapper.dart';
import 'package:flutter_e_commerce/features/authentication/domain/model/session.dart';
import 'package:flutter_e_commerce/features/authentication/application/screen/login.dart';
import 'package:flutter_e_commerce/features/authentication/application/controller/auth_provider.dart';
import 'package:flutter_e_commerce/features/cart/application/screen/cart_screen.dart';
import 'package:flutter_e_commerce/features/products/application/screen/detail_product_screen.dart';
import 'package:flutter_e_commerce/features/products/application/screen/products_list_screen.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

enum _SessionEnum { isLoggedIn, needsAuth }

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final listenable = ValueNotifier<_SessionEnum?>(null);

  final router = GoRouter(
    refreshListenable: listenable,
    debugLogDiagnostics: false,
    errorBuilder: (_, __) => const Material(),
    routerNeglect: false,
    initialLocation: '/splash',
    observers: const [],
    redirect: (context, state) {
      final session = listenable.value;
      if (session == null) {
        return null;
      }
      final path = state.uri.path;
      return switch (session) {
        _SessionEnum.needsAuth =>
          path.startsWith('/auth') ? null : '/auth/sign-in',
        _SessionEnum.isLoggedIn => path.startsWith('/auth') || path == '/splash'
            ? '/home/products'
            : null,
      };
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (_, state, child) {
          return CardPresentationWrapper(
            index: switch(state.uri.path) {
              '/auth/sign-up' => 1,
              _ => 0,
            },
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/auth/sign-in',
            name: RouteName.login,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: '/auth/sign-up',
            name: RouteName.signup,
            builder: (context, state) => const Material(),
          ),
        ],
      ),
      GoRoute(
        path: '/home/products',
        name: RouteName.products,
        builder: (context, state) => const ProductListScreen(),
        routes: [
          GoRoute(
            path: ':id',
            name: RouteName.productDetails,
            redirect: (context, state) {
              final id = state.pathParameters['id'];
              return id == null || int.tryParse(id) == null
                  ? RouteName.products
                  : null;
            },
            builder: (context, state) {
              return ProductScreen(
                id: int.parse(state.pathParameters['id']!),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/home/cart',
        name: RouteName.cart,
        builder: (context, state) => const CartScreen(),
      ),
    ],
  );

  /* ref.listen(
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
  ); */

  /// This is a hacky way to bypass go router redirections, using a listenable
  /// in go_router can redirect the last route to the desirable path, but the
  /// rest of pages still remains
  ///
  /// With this we assure that if a change in authentication happens the stack
  /// is cleared before replacing the remaining route
  ///
  ref.listen(
    authServiceProvider,
    (previous, next) {
      final previousSession = listenable.value;
      final nextSession = next.maybeMap(
        data: (data) => switch (data.value) {
          NoSession() => _SessionEnum.needsAuth,
          OAuthSession() => _SessionEnum.isLoggedIn,
        },
        error: (error) =>
            error.hasValue ? listenable.value : _SessionEnum.needsAuth,
        orElse: () => listenable.value,
      );
      if (previousSession == nextSession) {
        return;
      }
      final path = router.routerDelegate.currentConfiguration.uri.path;
      switch (nextSession) {
        case _SessionEnum.needsAuth:
          if (!path.startsWith('/auth')) {
            while (router.canPop()) {
              router.pop();
            }
          }
          break;
        case _SessionEnum.isLoggedIn:
          if (path.startsWith('/auth') || path == '/splash') {
            while (router.canPop()) {
              router.pop();
            }
          }
          break;
        case null:
        default:
          break;
      }
      listenable.value = nextSession;
    },
    fireImmediately: true,
  );
  ref.onDispose(listenable.dispose);

  return router;
}
