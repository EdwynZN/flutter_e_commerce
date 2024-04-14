// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cacheManagerHash() => r'a0fa35a2046c8b837ab2b611c56751db9dd5e718';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [cacheManager].
@ProviderFor(cacheManager)
const cacheManagerProvider = CacheManagerFamily();

/// See also [cacheManager].
class CacheManagerFamily extends Family<CacheManager> {
  /// See also [cacheManager].
  const CacheManagerFamily();

  /// See also [cacheManager].
  CacheManagerProvider call({
    String cacheKey = CacheConstants.products,
  }) {
    return CacheManagerProvider(
      cacheKey: cacheKey,
    );
  }

  @override
  CacheManagerProvider getProviderOverride(
    covariant CacheManagerProvider provider,
  ) {
    return call(
      cacheKey: provider.cacheKey,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cacheManagerProvider';
}

/// See also [cacheManager].
class CacheManagerProvider extends AutoDisposeProvider<CacheManager> {
  /// See also [cacheManager].
  CacheManagerProvider({
    String cacheKey = CacheConstants.products,
  }) : this._internal(
          (ref) => cacheManager(
            ref as CacheManagerRef,
            cacheKey: cacheKey,
          ),
          from: cacheManagerProvider,
          name: r'cacheManagerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cacheManagerHash,
          dependencies: CacheManagerFamily._dependencies,
          allTransitiveDependencies:
              CacheManagerFamily._allTransitiveDependencies,
          cacheKey: cacheKey,
        );

  CacheManagerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cacheKey,
  }) : super.internal();

  final String cacheKey;

  @override
  Override overrideWith(
    CacheManager Function(CacheManagerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CacheManagerProvider._internal(
        (ref) => create(ref as CacheManagerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cacheKey: cacheKey,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CacheManager> createElement() {
    return _CacheManagerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CacheManagerProvider && other.cacheKey == cacheKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cacheKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CacheManagerRef on AutoDisposeProviderRef<CacheManager> {
  /// The parameter `cacheKey` of this provider.
  String get cacheKey;
}

class _CacheManagerProviderElement
    extends AutoDisposeProviderElement<CacheManager> with CacheManagerRef {
  _CacheManagerProviderElement(super.provider);

  @override
  String get cacheKey => (origin as CacheManagerProvider).cacheKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
