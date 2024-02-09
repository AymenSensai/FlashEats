import 'package:flash_eats/features/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_eats/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flash_eats/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../login/ui/widgets/terms_and_conditions_text.dart';
import '../logic/sign_up_cubit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyles.font24OrangeBold,
                    ),
                    verticalSpace(8),
                    Text(
                      "Sign up now to discover a world of delicious delights and menu filled with irresistible flavors waiting just for you.",
                      style: TextStyles.font16SteelGrayRegular,
                    ),
                    verticalSpace(32),
                    Column(
                      children: [
                        const SignupForm(),
                        verticalSpace(32),
                        AppTextButton(
                          buttonText: "Create Account",
                          textStyle: TextStyles.font18WhiteSemiBold,
                          onPressed: () {
                            validateThenDoSignup(context);
                          },
                        ),
                        verticalSpace(32),
                        const TermsAndConditionsText(),
                        verticalSpace(32),
                        const AlreadyHaveAccountText(),
                        const SignupBlocListener(),
                      ],
                    ),
                  ]))),
    )));
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
