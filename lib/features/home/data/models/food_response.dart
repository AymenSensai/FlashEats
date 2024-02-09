import 'package:json_annotation/json_annotation.dart';
part 'food_response.g.dart';

@JsonSerializable()
class FoodResponse {
  String? message;
  @JsonKey(name: 'data')
  FoodData? foodData;
  bool? status;
  int? code;

  FoodResponse({this.message, this.foodData, this.status, this.code});

  factory FoodResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodResponseFromJson(json);
}

@JsonSerializable()
class FoodData {
  String? name;
  String? description;
  String? price;
  String? image;
  String? type;

  FoodData({this.name, this.description, this.price, this.image, this.type});

  factory FoodData.fromJson(Map<String, dynamic> json) =>
      _$FoodDataFromJson(json);
}
