import 'package:flash_eats/core/networking/api_error_handler.dart';
import 'package:flash_eats/core/networking/api_result.dart';
import 'package:flash_eats/core/networking/api_service.dart';
import 'package:flash_eats/features/cart/data/models/cart_request_body.dart';
import 'package:flash_eats/features/cart/data/models/cart_response.dart';

class CartRepo {
  final ApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<CartResponse>> getCartFood(String token) async {
    try {
      final response = await _apiService.getCartFood(token);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<CartResponse>> deleteCartFood(
      String token, CartRequestBody cartRequestBody) async {
    try {
      final response = await _apiService.deleteCartFood(token, cartRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
