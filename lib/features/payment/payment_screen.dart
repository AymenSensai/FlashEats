import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flash_eats/core/widgets/centered_title_app_bar.dart';
import 'package:flash_eats/features/payment/logic/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centeredTitleAppBar("Payment"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AppTextButton(
          onPressed: () =>
              context.read<PaymentCubit>().makePayment(price, "USD"),
          buttonText: "Pay ${price.toInt()} dollar",
          textStyle: TextStyles.font18WhiteSemiBold,
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
