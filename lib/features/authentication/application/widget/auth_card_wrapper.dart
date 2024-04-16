import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/routing/route_names.dart';
import 'package:go_router/go_router.dart';

const double _stepWidth = 56.0;
const double _aspectRatio = 16.0 / 10.0;

/// This widgets wraps the login and signup screen so the bottom bar can change routes
/// while only the inner child updates. The UI will be mantained and only the form will change
class CardPresentationWrapper extends StatefulWidget {
  final int index;
  final Widget child;
  final double aspectRatio;

  const CardPresentationWrapper({
    super.key,
    required this.child,
    required this.index,
    this.aspectRatio = _aspectRatio,
  });

  @override
  State<CardPresentationWrapper> createState() =>
      _CardPresentationWrapperState();
}

class _CardPresentationWrapperState extends State<CardPresentationWrapper> {
  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        context.goNamed(RouteName.signup);
        break;
      case 0:
      default:
        context.goNamed(RouteName.login);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = Platform.isIOS && (parentRoute?.canPop ?? false);
    final brightness =
        ThemeData.estimateBrightnessForColor(theme.scaffoldBackgroundColor);
    final color = theme.colorScheme.primaryContainer;
    final isPhone = MediaQuery.of(context).size.longestSide < 960;
    Widget card = widget.child;

    Widget assetLogo = ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: const SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: FittedBox(fit: BoxFit.contain, child: FlutterLogo(size: 200)),
        ),
      ),
    );

    if (canPop) {
      assetLogo = Stack(
        fit: StackFit.passthrough,
        children: [
          assetLogo,
          Positioned(
            top: 12.0,
            left: 12.0,
            child: BackButton(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      );
    }

    if (!isPhone) {
      final orientation = MediaQuery.of(context).orientation;
      const constraints = BoxConstraints(
        minWidth: _stepWidth * 7,
        maxWidth: _stepWidth * 8,
      );
      if (orientation == Orientation.portrait) {
        card = ConstrainedBox(
          constraints: constraints,
          child: AspectRatio(
            aspectRatio: 1.0 / widget.aspectRatio,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 7,
                  child: assetLogo,
                ),
                Expanded(
                  flex: 16,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.primaryColor,
                          theme.primaryColor.withOpacity(0.75),
                        ],
                      ),
                    ),
                    child: card,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        card = ConstrainedBox(
          constraints: constraints.flipped,
          child: AspectRatio(
            aspectRatio: widget.aspectRatio,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.primaryColor,
                          theme.primaryColor.withOpacity(0.75),
                        ],
                      ),
                    ),
                    child: card,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: assetLogo,
                ),
              ],
            ),
          ),
        );
      }
      card = DecoratedBox(
        decoration: BoxDecoration(color: color),
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Center(
            child: card,
          ),
        ),
      );
    } else {
      card = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: assetLogo,
          ),
          Flexible(
            flex: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
              child: card,
            ),
          ),
        ],
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            brightness == Brightness.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: theme.colorScheme.primary,
        statusBarBrightness: brightness,
        systemStatusBarContrastEnforced: false,
      ),
      child: Scaffold(
        backgroundColor: color,
        resizeToAvoidBottomInset: false,
        body: card,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.login),
              icon: Icon(Icons.login_outlined),
              label: 'Log in',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.verified_user_rounded),
              icon: Icon(Icons.verified_user_outlined),
              label: 'Sign up',
            ),
          ],
          currentIndex: widget.index,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
