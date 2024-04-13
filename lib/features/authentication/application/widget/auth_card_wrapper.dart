import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/common/assets/resources.dart';

const double _stepWidth = 56.0;
const double _aspectRatio = 16.0 / 10.0;

class CardPresentationWrapper extends StatelessWidget {
  final Widget child;
  final double aspectRatio;

  const CardPresentationWrapper({
   super.key,
    required this.child,
    this.aspectRatio = _aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = Platform.isIOS && (parentRoute?.canPop ?? false);
    final brightness =
        ThemeData.estimateBrightnessForColor(theme.scaffoldBackgroundColor);
    final isPhone = MediaQuery.of(context).size.longestSide < 960;
    Widget card = Theme(
      data: theme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: theme.elevatedButtonTheme.style?.copyWith(
            shape: MaterialStateProperty.all(const StadiumBorder()),
            elevation: MaterialStateProperty.all(0.0),
            foregroundColor:
                MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.pressed)) {
                    return theme.colorScheme.onPrimary;
                  }
              if (states.contains(MaterialState.disabled)) {
                return theme.disabledColor;
              }
              return null;
            }),
            backgroundColor:
                MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.pressed)) {
                return theme.primaryColorDark;
              }
              if (states.contains(MaterialState.disabled)) return null;
              return theme.colorScheme.background;
            }),
          ),
        ),
        iconTheme: theme.primaryIconTheme,
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: false,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.background),
          ),
          labelStyle: theme.primaryTextTheme.titleLarge,
        ),
        textButtonTheme: TextButtonThemeData(
          style: theme.textButtonTheme.style?.copyWith(
            shape: MaterialStateProperty.all(const StadiumBorder()),
            overlayColor:
                MaterialStateProperty.all(theme.canvasColor.withOpacity(0.25)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.all<Color?>(
              theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
      child: child,
    );

    Widget assetLogo = ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Image.asset(
        Logos.platzi,
        fit: isPhone ? BoxFit.contain : null,
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
            aspectRatio: 1.0 / aspectRatio,
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
            aspectRatio: aspectRatio,
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
        decoration: const BoxDecoration(color: Color(0xBF0D573E)),
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
              decoration: const BoxDecoration(color: Color(0xBF0D573E)),
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
        systemNavigationBarColor: Colors.transparent,
        statusBarBrightness: brightness,
        systemStatusBarContrastEnforced: false,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: card,
      ),
    );
  }
}
