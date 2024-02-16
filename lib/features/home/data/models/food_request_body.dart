import 'package:json_annotation/json_annotation.dart';
part 'food_request_body.g.dart';

@JsonSerializable()
class FoodRequestBody {
  final String? type;

  FoodRequestBody({this.type});

  Map<String, dynamic> toJson() => _$FoodRequestBodyToJson(this);
}
