import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/screen/splash.dart';
import 'package:flutter_e_commerce/features/authentication/application/screen/login.dart';
import 'package:flutter_e_commerce/features/products/application/screen/products_list_screen.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter({
  String initial = '/',
  bool routerNeglect = true,
  bool debugLogDiagnostics = kDebugMode,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    debugLogDiagnostics: debugLogDiagnostics,
    errorBuilder: (_, __) => const Material(),
    routerNeglect: routerNeglect,
    initialLocation: initial,
    observers: observers,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
        routes: [
          ShellRoute(
            builder: (context, state, child) => Scaffold(body: child),
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
