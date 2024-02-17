import 'package:dio/dio.dart';
import 'package:flash_eats/core/networking/api_constants.dart';
import 'package:flash_eats/features/details/data/models/details_request_body.dart';
import 'package:flash_eats/features/details/data/models/details_response.dart';
import 'package:flash_eats/features/home/data/models/food_request_body.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/login/data/models/login_request_body.dart';
import 'package:flash_eats/features/login/data/models/login_response.dart';
import 'package:flash_eats/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flash_eats/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @GET(ApiConstants.food)
  Future<FoodResponse> getFood(@Queries() FoodRequestBody foodRequestBody);

  @GET(ApiConstants.popularFood)
  Future<FoodResponse> getPopularFood();

  @GET(ApiConstants.favorites)
  Future<FoodResponse> getFavorites(@Header('Authorization') String token);

  @PUT(ApiConstants.favorites)
  Future<FoodResponse> addFavorite(@Header('Authorization') String token,
      @Body() DetailsRequestBody detailsRequestBody);

  @DELETE(ApiConstants.favorites)
  Future<FoodResponse> deleteFavorite(@Header('Authorization') String token,
      @Body() DetailsRequestBody detailsRequestBody);

  @GET(ApiConstants.containsFavorite)
  Future<DetailsResponse> containsFavorite(
      @Header('Authorization') String token,
      @Queries() DetailsRequestBody detailsRequestBody);
}
