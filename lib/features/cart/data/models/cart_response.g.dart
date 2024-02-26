// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CartInfo.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'status': instance.status,
      'code': instance.code,
    };

CartInfo _$CartInfoFromJson(Map<String, dynamic> json) => CartInfo(
      cartPrice: (json['cart_price'] as num).toDouble(),
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => CartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartInfoToJson(CartInfo instance) => <String, dynamic>{
      'cart_price': instance.cartPrice,
      'cart': instance.cart,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      id: json['id'] as int,
      food: FoodData.fromJson(json['food'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      userTopicsExtra: (json['user_topics_extra'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      userTopicsToRemove: (json['user_topics_to_remove'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'id': instance.id,
      'food': instance.food,
      'quantity': instance.quantity,
      'user_topics_extra': instance.userTopicsExtra,
      'user_topics_to_remove': instance.userTopicsToRemove,
    };
