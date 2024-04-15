
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ValueNotifier<bool> useValidateForm(List<TextEditingController> controllers) {
  final state =
      useState(controllers.map((e) => e.text).every((cb) => cb.isNotEmpty));
  useEffect(() {
    void shouldActivate() {
      state.value = controllers.map((e) => e.text).every((cb) => cb.isNotEmpty);
    }

    for (final c in controllers) {
      c.addListener(shouldActivate);
    }

    return () {
      for (final c in controllers) {
        c.removeListener(shouldActivate);
      }
    };
  }, controllers);
  return state;
}
