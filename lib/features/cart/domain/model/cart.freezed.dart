// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  List<PurchasedItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call({List<PurchasedItem> items});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchasedItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PurchasedItem> items});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$CartImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchasedItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl extends _Cart {
  _$CartImpl({required final List<PurchasedItem> items})
      : _items = items,
        super._();

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  final List<PurchasedItem> _items;
  @override
  List<PurchasedItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Cart(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart extends Cart {
  factory _Cart({required final List<PurchasedItem> items}) = _$CartImpl;
  _Cart._() : super._();

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  List<PurchasedItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchasedItem _$PurchasedItemFromJson(Map<String, dynamic> json) {
  return _PurchasedItem.fromJson(json);
}

/// @nodoc
mixin _$PurchasedItem {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  ItemProduct get product => throw _privateConstructorUsedError;
  @HiveField(2)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(3)
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchasedItemCopyWith<PurchasedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasedItemCopyWith<$Res> {
  factory $PurchasedItemCopyWith(
          PurchasedItem value, $Res Function(PurchasedItem) then) =
      _$PurchasedItemCopyWithImpl<$Res, PurchasedItem>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) ItemProduct product,
      @HiveField(2) int quantity,
      @HiveField(3) double price});
}

/// @nodoc
class _$PurchasedItemCopyWithImpl<$Res, $Val extends PurchasedItem>
    implements $PurchasedItemCopyWith<$Res> {
  _$PurchasedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ItemProduct,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchasedItemImplCopyWith<$Res>
    implements $PurchasedItemCopyWith<$Res> {
  factory _$$PurchasedItemImplCopyWith(
          _$PurchasedItemImpl value, $Res Function(_$PurchasedItemImpl) then) =
      __$$PurchasedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) ItemProduct product,
      @HiveField(2) int quantity,
      @HiveField(3) double price});
}

/// @nodoc
class __$$PurchasedItemImplCopyWithImpl<$Res>
    extends _$PurchasedItemCopyWithImpl<$Res, _$PurchasedItemImpl>
    implements _$$PurchasedItemImplCopyWith<$Res> {
  __$$PurchasedItemImplCopyWithImpl(
      _$PurchasedItemImpl _value, $Res Function(_$PurchasedItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$PurchasedItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ItemProduct,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'PurchasedItemAdapter')
class _$PurchasedItemImpl implements _PurchasedItem {
  const _$PurchasedItemImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.product,
      @HiveField(2) required this.quantity,
      @HiveField(3) required this.price});

  factory _$PurchasedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchasedItemImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final ItemProduct product;
  @override
  @HiveField(2)
  final int quantity;
  @override
  @HiveField(3)
  final double price;

  @override
  String toString() {
    return 'PurchasedItem(id: $id, product: $product, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchasedItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, product, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchasedItemImplCopyWith<_$PurchasedItemImpl> get copyWith =>
      __$$PurchasedItemImplCopyWithImpl<_$PurchasedItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchasedItemImplToJson(
      this,
    );
  }
}

abstract class _PurchasedItem implements PurchasedItem {
  const factory _PurchasedItem(
      {@HiveField(0) required final int id,
      @HiveField(1) required final ItemProduct product,
      @HiveField(2) required final int quantity,
      @HiveField(3) required final double price}) = _$PurchasedItemImpl;

  factory _PurchasedItem.fromJson(Map<String, dynamic> json) =
      _$PurchasedItemImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  ItemProduct get product;
  @override
  @HiveField(2)
  int get quantity;
  @override
  @HiveField(3)
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$PurchasedItemImplCopyWith<_$PurchasedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemProduct _$ItemProductFromJson(Map<String, dynamic> json) {
  return _ItemProduct.fromJson(json);
}

/// @nodoc
mixin _$ItemProduct {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'ItemProductAdapter')
class _$ItemProductImpl implements _ItemProduct {
  const _$ItemProductImpl(
      {@HiveField(0) required this.id, @HiveField(1) required this.name});

  factory _$ItemProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemProductImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;

  @override
  String toString() {
    return 'ItemProduct(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemProductImplToJson(
      this,
    );
  }
}

abstract class _ItemProduct implements ItemProduct {
  const factory _ItemProduct(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name}) = _$ItemProductImpl;

  factory _ItemProduct.fromJson(Map<String, dynamic> json) =
      _$ItemProductImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
}
