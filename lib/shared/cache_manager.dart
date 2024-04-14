import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_e_commerce/utils/cache_constants.dart';
import 'package:flutter_e_commerce/utils/dispose_ref_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_manager.g.dart';

@riverpod
CacheManager cacheManager(
  CacheManagerRef ref, {
  String cacheKey = CacheConstants.products,
}) {
  final cacheManager = CacheManager(
    Config(
      cacheKey,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 300,
    ),
  );

  ref
    ..disposeDelay(const Duration(seconds: 30))
    ..onDispose(() async {
      await cacheManager.dispose();
    });

  return cacheManager;
}
