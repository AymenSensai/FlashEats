import 'package:flash_eats/features/payment/data/models/payment_request_body.dart';
import 'package:flash_eats/features/payment/data/repos/payment_repo.dart';
import 'package:flash_eats/features/payment/logic/cubit/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _paymentRepo;
  PaymentCubit(this._paymentRepo) : super(const PaymentState.initial());

  void makePayment(double amount, String currency) async {
    emit(const PaymentState.loading());
    final response = await _paymentRepo.getClientSecret(
        PaymentRequestBody((amount * 100).toStringAsFixed(0), currency));
    response.when(success: (response) async {
      await _initializePaymentSheet(response.clientSecret!);
      await Stripe.instance.presentPaymentSheet();
    }, failure: (error) {
      emit(PaymentState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Aymen",
      ),
    );
  }
}
