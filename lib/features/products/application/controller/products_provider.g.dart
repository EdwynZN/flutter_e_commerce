// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'c074d789a78e23005a0fca6bab9b91c781ce2723';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productNotifierHash() => r'988cf25d640e81833c3627fab6be267ef524c50a';

/// See also [ProductNotifier].
@ProviderFor(ProductNotifier)
final productNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ProductNotifier, List<Product>>.internal(
  ProductNotifier.new,
  name: r'productNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductNotifier = AutoDisposeAsyncNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
