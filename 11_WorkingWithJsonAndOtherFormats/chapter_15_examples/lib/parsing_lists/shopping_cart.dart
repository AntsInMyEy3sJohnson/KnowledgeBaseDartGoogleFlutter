import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart.g.dart';

@JsonSerializable()
class ShoppingCart {
  int total;

  // Provide empty list in case key is missing in input to make sure list is
  // always initialized
  @JsonKey(defaultValue: [])
  List<int> itemIDs;

  ShoppingCart();

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingCartToJson(this);
}
