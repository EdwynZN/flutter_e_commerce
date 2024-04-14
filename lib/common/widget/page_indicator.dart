import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PageIndicator extends HookWidget {
  final int count;
  final PageController controller;

  const PageIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final initialState = useState(controller.initialPage);
    final selected = useListenableSelector(
      controller,
      () => !controller.hasClients ? null : controller.page?.round(),
    );

    /// when it's not attached (hasClients == false) 
    /// it asks periodically until it attaches and 
    /// returns the initial position (and cancel the timer)
    useEffect(
      () {
        if (controller.hasClients) {
          return null;
        }
        final Timer timer = Timer.periodic(
          const Duration(milliseconds: 250),
          (timer) {
            if (controller.hasClients) {
              timer.cancel();
              initialState.value = controller.page?.round() ?? 0;
            }
          },
        );
        return timer.cancel;
      },
      [controller.hasClients, controller, initialState],
    );
    final primary = Theme.of(context).colorScheme.primary;
    final trueSelected = selected ?? initialState.value;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: ShapeDecoration(
              color: primary.withOpacity(trueSelected == index ? 1 : 0.24),
              shape: const CircleBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
