import 'package:flash_eats/core/networking/api_error_handler.dart';
import 'package:flash_eats/core/networking/api_result.dart';
import 'package:flash_eats/core/networking/api_service.dart';
import 'package:flash_eats/features/profile/data/models/personal_information_request_body.dart';
import 'package:flash_eats/features/profile/data/models/personal_information_response.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult> logout(String token) async {
    try {
      final response = await _apiService.logout(token);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<PersonalInformationResponse>> update(
      PersonalInformationRequestBody personalInformationRequestBody) async {
    try {
      final response = await _apiService.update(personalInformationRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
