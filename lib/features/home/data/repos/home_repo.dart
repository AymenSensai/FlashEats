import 'package:flash_eats/core/networking/api_error_handler.dart';
import 'package:flash_eats/core/networking/api_result.dart';
import 'package:flash_eats/core/networking/api_service.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<FoodResponse>> getFood() async {
    try {
      final response = await _apiService.getFood();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
