import 'package:json_annotation/json_annotation.dart';
part 'personal_information_request_body.g.dart';

@JsonSerializable()
class PersonalInformationRequestBody {
  final String username;
  final String email;
  final String phone;
  final String password;

  PersonalInformationRequestBody({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$PersonalInformationRequestBodyToJson(this);
}
