import 'package:flash_eats/core/networking/api_error_handler.dart';
import 'package:flash_eats/core/networking/api_result.dart';
import 'package:flash_eats/core/networking/stripe_service.dart';
import 'package:flash_eats/features/payment/data/models/payment_request_body.dart';
import 'package:flash_eats/features/payment/data/models/payment_response.dart';

class PaymentRepo {
  final StripeService _stripeService;

  PaymentRepo(this._stripeService);

  Future<ApiResult<PaymentResponse>> getClientSecret(
      PaymentRequestBody paymentRequestBody) async {
    try {
      final response = await _stripeService.getClientSecret(paymentRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
