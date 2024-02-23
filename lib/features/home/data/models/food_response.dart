import 'package:json_annotation/json_annotation.dart';
part 'food_response.g.dart';

@JsonSerializable()
class FoodResponse {
  String? message;
  @JsonKey(name: 'data')
  List<FoodData>? foodData;
  bool? status;
  int? code;

  FoodResponse({this.message, this.foodData, this.status, this.code});

  factory FoodResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodResponseFromJson(json);
}

@JsonSerializable()
class FoodData {
  int id;
  String name;
  String description;
  double price;
  String image;
  String type;
  @JsonKey(name: 'topics_extra')
  List<Topic> topicsExtra;
  @JsonKey(name: 'topics_to_remove')
  List<Topic> topicsToRemove;
  FoodData(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.type,
      required this.topicsExtra,
      required this.topicsToRemove});

  factory FoodData.fromJson(Map<String, dynamic> json) =>
      _$FoodDataFromJson(json);
}

@JsonSerializable()
class Topic {
  int id;
  String name;

  Topic({required this.id, required this.name});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
}
