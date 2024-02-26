import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  String? message;
  CartInfo? data;
  bool? status;
  int? code;

  CartResponse({this.message, this.data, this.status, this.code});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
}

@JsonSerializable()
class CartInfo {
  @JsonKey(name: 'cart_price')
  double cartPrice;
  List<CartData>? cart;
  CartInfo({required this.cartPrice, required this.cart});

  factory CartInfo.fromJson(Map<String, dynamic> json) =>
      _$CartInfoFromJson(json);
}

@JsonSerializable()
class CartData {
  int id;
  FoodData food;
  int quantity;
  @JsonKey(name: 'user_topics_extra')
  List<Topic> userTopicsExtra;
  @JsonKey(name: 'user_topics_to_remove')
  List<Topic> userTopicsToRemove;

  CartData(
      {required this.id,
      required this.food,
      required this.quantity,
      required this.userTopicsExtra,
      required this.userTopicsToRemove});

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);
}
