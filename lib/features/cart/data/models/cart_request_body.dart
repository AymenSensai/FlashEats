import 'package:json_annotation/json_annotation.dart';
part 'cart_request_body.g.dart';

@JsonSerializable()
class CartRequestBody {
  final int id;

  CartRequestBody({required this.id});

  Map<String, dynamic> toJson() => _$CartRequestBodyToJson(this);
}
