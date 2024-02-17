import 'package:flash_eats/core/networking/api_error_handler.dart';
import 'package:flash_eats/core/networking/api_result.dart';
import 'package:flash_eats/core/networking/api_service.dart';
import 'package:flash_eats/features/details/data/models/details_request_body.dart';
import 'package:flash_eats/features/details/data/models/details_response.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';

class DetailsRepo {
  final ApiService _apiService;

  DetailsRepo(this._apiService);

  Future<ApiResult<DetailsResponse>> containsFavorite(
      String token, DetailsRequestBody detailsRequestBody) async {
    try {
      final response =
          await _apiService.containsFavorite(token, detailsRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<FoodResponse>> addFavorite(
      String token, DetailsRequestBody detailsRequestBody) async {
    try {
      final response = await _apiService.addFavorite(token, detailsRequestBody);
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
