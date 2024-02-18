import 'package:flash_eats/core/networking/api_error_handler.dart';
import 'package:flash_eats/core/networking/api_result.dart';
import 'package:flash_eats/core/networking/api_service.dart';
import 'package:flash_eats/features/details/data/models/details_request_body.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';

class FavoriteRepo {
  final ApiService _apiService;

  FavoriteRepo(this._apiService);

  Future<ApiResult<FoodResponse>> getFavorites(String token) async {
    try {
      final response = await _apiService.getFavorites(token);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<FoodResponse>> deleteFavorite(
      String token, DetailsRequestBody detailsRequestBody) async {
    try {
      final response =
          await _apiService.deleteFavorite(token, detailsRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
