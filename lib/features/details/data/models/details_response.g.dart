// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsResponse _$DetailsResponseFromJson(Map<String, dynamic> json) =>
    DetailsResponse(
      message: json['message'] as String?,
      data: json['data'] as bool?,
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$DetailsResponseToJson(DetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };
