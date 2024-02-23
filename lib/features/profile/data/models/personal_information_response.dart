import 'package:json_annotation/json_annotation.dart';
part 'personal_information_response.g.dart';

@JsonSerializable()
class PersonalInformationResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  PersonalInformationResponse(
      {this.message, this.userData, this.status, this.code});

  factory PersonalInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalInformationResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  UserData({this.token, this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
