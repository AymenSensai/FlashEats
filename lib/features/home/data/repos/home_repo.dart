import 'package:flash_eats/core/networking/api_error_handler.dart';
import 'package:flash_eats/core/networking/api_result.dart';
import 'package:flash_eats/core/networking/api_service.dart';
import 'package:flash_eats/features/home/data/models/food_request_body.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/home/data/models/offer_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<FoodResponse>> getFood(
      FoodRequestBody foodRequestBody) async {
    try {
      final response = await _apiService.getFood(foodRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<FoodResponse>> getPopularFood() async {
    try {
      final response = await _apiService.getPopularFood();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<OfferResponse>> getOffersFood() async {
    try {
      final response = await _apiService.getOffersFood();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
