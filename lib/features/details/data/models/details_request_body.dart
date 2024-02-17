import 'package:json_annotation/json_annotation.dart';
part 'details_request_body.g.dart';

@JsonSerializable()
class DetailsRequestBody {
  final int id;

  DetailsRequestBody({required this.id});

  Map<String, dynamic> toJson() => _$DetailsRequestBodyToJson(this);
}
