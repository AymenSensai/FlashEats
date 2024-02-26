import 'package:json_annotation/json_annotation.dart';
part 'payment_response.g.dart';

@JsonSerializable()
class PaymentResponse {
  @JsonKey(name: 'client_secret')
  String? clientSecret;

  PaymentResponse({this.clientSecret});

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
}
