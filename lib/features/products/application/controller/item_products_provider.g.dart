// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemsPaginationHash() => r'39604379309db2cffc9e45a3982d45d6cf320809';

/// productNotifierProvider returns and Async<List<Products>> and cartControllerProvider
/// a Async<Cart>. This provider will combine both to get an actual list of products with the cart values as a DTO to the UI
/// so this can be use it after checking that productNotifierProvider as valid data
///
/// Copied from [itemsPagination].
@ProviderFor(itemsPagination)
final itemsPaginationProvider = AutoDisposeProvider<List<Item>>.internal(
  itemsPagination,
  name: r'itemsPaginationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemsPaginationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemsPaginationRef = AutoDisposeProviderRef<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
