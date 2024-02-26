// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferResponse _$OfferResponseFromJson(Map<String, dynamic> json) =>
    OfferResponse(
      message: json['message'] as String?,
      offers: (json['data'] as List<dynamic>?)
          ?.map((e) => OfferData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$OfferResponseToJson(OfferResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.offers,
      'status': instance.status,
      'code': instance.code,
    };

OfferData _$OfferDataFromJson(Map<String, dynamic> json) => OfferData(
      id: json['id'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$OfferDataToJson(OfferData instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
