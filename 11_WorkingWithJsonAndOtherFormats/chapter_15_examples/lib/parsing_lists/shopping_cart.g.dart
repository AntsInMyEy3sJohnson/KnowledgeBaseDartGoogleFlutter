// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) {
  return ShoppingCart()
    ..total = json['total'] as int
    ..itemIDs = (json['itemIDs'] as List)?.map((e) => e as int)?.toList() ?? [];
}

Map<String, dynamic> _$ShoppingCartToJson(ShoppingCart instance) =>
    <String, dynamic>{
      'total': instance.total,
      'itemIDs': instance.itemIDs,
    };
