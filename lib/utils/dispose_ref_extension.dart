import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeTimer<T> on AutoDisposeRef<T> {
  /// fixes [https://github.com/Baseflow/flutter_cache_manager/pull/418] but 
  /// can be used in any other provider that wants to live a little more
  void disposeDelay(Duration duration) {
    final link = keepAlive();
    Timer? timer;

    onCancel(() {
      timer?.cancel();
      timer = Timer(duration, link.close);
    });

    onDispose(() {
      timer?.cancel();
    });

    onResume(() {
      timer?.cancel();
    });
  }
}