import 'package:dio/dio.dart';
import 'package:flash_eats/core/networking/api_constants.dart';
import 'package:flash_eats/features/payment/data/models/payment_request_body.dart';
import 'package:flash_eats/features/payment/data/models/payment_response.dart';
import 'package:retrofit/retrofit.dart';

part 'stripe_service.g.dart';

@RestApi(baseUrl: ApiConstants.stripeBaseUrl)
abstract class StripeService {
  factory StripeService(Dio dio, {String baseUrl}) = _StripeService;

  @POST('payment_intents')
  Future<PaymentResponse> getClientSecret(
    @Body() PaymentRequestBody paymentRequestBody,
  );
}
