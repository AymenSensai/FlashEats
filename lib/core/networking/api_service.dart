import 'package:dio/dio.dart';
import 'package:flash_eats/core/networking/api_constants.dart';
import 'package:flash_eats/features/cart/data/models/cart_request_body.dart';
import 'package:flash_eats/features/cart/data/models/cart_response.dart';
import 'package:flash_eats/features/details/data/models/details_request_body.dart';
import 'package:flash_eats/features/details/data/models/details_response.dart';
import 'package:flash_eats/features/home/data/models/food_request_body.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/home/data/models/offer_response.dart';
import 'package:flash_eats/features/login/data/models/login_request_body.dart';
import 'package:flash_eats/features/login/data/models/login_response.dart';
import 'package:flash_eats/features/profile/data/models/personal_information_request_body.dart';
import 'package:flash_eats/features/profile/data/models/personal_information_response.dart';
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

  @POST(ApiConstants.signup)
  Future<PersonalInformationResponse> update(
    @Body() PersonalInformationRequestBody personalInformationRequestBody,
  );

  @POST(ApiConstants.logout)
  Future<SignupResponse> logout(@Header('Authorization') String token);

  @GET(ApiConstants.food)
  Future<FoodResponse> getFood(@Queries() FoodRequestBody foodRequestBody);

  @GET(ApiConstants.popularFood)
  Future<FoodResponse> getPopularFood();

  @GET(ApiConstants.offer)
  Future<OfferResponse> getOffersFood();

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

  @GET(ApiConstants.cart)
  Future<CartResponse> getCartFood(@Header('Authorization') String token);

  @PUT(ApiConstants.cart)
  Future<CartResponse> addCartFood(@Header('Authorization') String token);

  @DELETE(ApiConstants.cart)
  Future<CartResponse> deleteCartFood(@Header('Authorization') String token,
      @Body() CartRequestBody cartRequestBody);
}
