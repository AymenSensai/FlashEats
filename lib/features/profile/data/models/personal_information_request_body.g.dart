// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_information_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInformationRequestBody _$PersonalInformationRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PersonalInformationRequestBody(
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$PersonalInformationRequestBodyToJson(
        PersonalInformationRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
    };
