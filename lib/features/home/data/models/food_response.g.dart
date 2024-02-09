// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodResponse _$FoodResponseFromJson(Map<String, dynamic> json) => FoodResponse(
      message: json['message'] as String?,
      foodData: json['data'] == null
          ? null
          : FoodData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$FoodResponseToJson(FoodResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.foodData,
      'status': instance.status,
      'code': instance.code,
    };

FoodData _$FoodDataFromJson(Map<String, dynamic> json) => FoodData(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$FoodDataToJson(FoodData instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'type': instance.type,
    };
