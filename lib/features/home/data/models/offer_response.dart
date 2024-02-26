import 'package:json_annotation/json_annotation.dart';
part 'offer_response.g.dart';

@JsonSerializable()
class OfferResponse {
  String? message;
  @JsonKey(name: 'data')
  List<OfferData>? offers;
  bool? status;
  int? code;

  OfferResponse({this.message, this.offers, this.status, this.code});

  factory OfferResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferResponseFromJson(json);
}

@JsonSerializable()
class OfferData {
  int id;
  String image;

  OfferData({required this.id, required this.image});

  factory OfferData.fromJson(Map<String, dynamic> json) =>
      _$OfferDataFromJson(json);
}
