import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class FadeSlideConfiguration extends ModalConfiguration {
  /// Creates the Material fade transition configuration.
  ///
  /// [barrierDismissible] configures whether or not tapping the modal's
  /// scrim dismisses the modal. [barrierLabel] sets the semantic label for
  /// a dismissible barrier. [barrierDismissible] cannot be null. If
  /// [barrierDismissible] is true, the [barrierLabel] cannot be null.
  const FadeSlideConfiguration({
    super.barrierColor = Colors.black54,
    super.barrierDismissible = true,
    super.transitionDuration = kThemeChangeDuration,
    super.reverseTransitionDuration = kThemeChangeDuration,
    String super.barrierLabel = 'Dismiss',
  });

  @override
  Widget transitionBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _FadeSlideTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }
}

class _FadeSlideTransition extends StatelessWidget {
  /// Creates a widget that implements the Material fade transition.
  ///
  /// The fade pattern is used for UI elements that enter or exit from within
  /// the screen bounds. Elements that enter use a quick fade in and scale from
  /// 80% to 100%. Elements that exit simply fade out. The scale animation is
  /// only applied to entering elements to emphasize new content over old.
  ///
  /// This widget is not to be confused with Flutter's [FadeTransition] widget,
  /// which animates only the opacity of its child widget.
  ///
  /// [animation] is typically an [AnimationController] that drives the transition
  /// animation. [animation] cannot be null.
  const _FadeSlideTransition({
    // ignore: unused_element
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    this.child,
  });

  /// The animation that drives the [child]'s entrance and exit.
  ///
  /// See also:
  ///
  ///  * [TransitionRoute.animate], which is the value given to this property
  ///    when it is used as a page transition.
  final Animation<double> animation;

  final Animation<double> secondaryAnimation;

  /// The widget below this widget in the tree.
  ///
  /// This widget will transition in and out as driven by [animation] and
  /// [secondaryAnimation].
  final Widget? child;

  static final Animatable<double> _fadeInTransition = CurveTween(
    curve: const Interval(0.0, 0.3),
  );
  static final Animatable<Offset> _slideTransiion = Tween<Offset>(
    begin: const Offset(0, 0.125),
    end: Offset.zero,
  ).chain(CurveTween(curve: decelerateEasing));
  static final Animatable<Offset> _slideOutTransiion = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 0.125),
  ).chain(CurveTween(curve: decelerateEasing));
  static final Animatable<double> _fadeOutTransition = Tween<double>(
    begin: 1.0,
    end: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return DualTransitionBuilder(
      animation: animation,
      forwardBuilder: (
        BuildContext context,
        Animation<double> animation,
        Widget? child,
      ) {
        return FadeTransition(
          opacity: _fadeInTransition.animate(animation),
          child: SlideTransition(
            position: _slideTransiion.animate(animation),
            child: child,
          ),
        );
      },
      reverseBuilder: (
        BuildContext context,
        Animation<double> animation,
        Widget? child,
      ) {
        return FadeTransition(
          opacity: _fadeOutTransition.animate(animation),
          child: SlideTransition(
            position: _slideOutTransiion.animate(animation),
            child: child,
          ),
        );
      },
      child: DualTransitionBuilder(
        animation: ReverseAnimation(secondaryAnimation),
        forwardBuilder: (
          BuildContext context,
          Animation<double> animation,
          Widget? child,
        ) {
          return FadeTransition(
            opacity: _fadeInTransition.animate(animation),
            child: SlideTransition(
              position: _slideTransiion.animate(animation),
              child: child!,
            ),
          );
        },
        reverseBuilder: (
          BuildContext context,
          Animation<double> animation,
          Widget? child,
        ) {
          return FadeTransition(
            opacity: _fadeOutTransition.animate(animation),
            child: SlideTransition(
              position: _slideOutTransiion.animate(animation),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
