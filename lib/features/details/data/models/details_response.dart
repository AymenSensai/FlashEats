import 'package:json_annotation/json_annotation.dart';
part 'details_response.g.dart';

@JsonSerializable()
class DetailsResponse {
  String? message;
  bool? data;
  bool? status;
  int? code;

  DetailsResponse({this.message, this.data, this.status, this.code});

  factory DetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailsResponseFromJson(json);
}
