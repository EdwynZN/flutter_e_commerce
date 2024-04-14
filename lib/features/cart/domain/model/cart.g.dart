// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchasedItemAdapter extends TypeAdapter<_$PurchasedItemImpl> {
  @override
  final int typeId = 0;

  @override
  _$PurchasedItemImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PurchasedItemImpl(
      id: fields[0] as int,
      product: fields[1] as ItemProduct,
      quantity: fields[2] as int,
      price: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$PurchasedItemImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.product)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchasedItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemProductAdapter extends TypeAdapter<_$ItemProductImpl> {
  @override
  final int typeId = 1;

  @override
  _$ItemProductImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ItemProductImpl(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$ItemProductImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => PurchasedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$PurchasedItemImpl _$$PurchasedItemImplFromJson(Map<String, dynamic> json) =>
    _$PurchasedItemImpl(
      id: json['id'] as int,
      product: ItemProduct.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$PurchasedItemImplToJson(_$PurchasedItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
      'price': instance.price,
    };

_$ItemProductImpl _$$ItemProductImplFromJson(Map<String, dynamic> json) =>
    _$ItemProductImpl(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ItemProductImplToJson(_$ItemProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
