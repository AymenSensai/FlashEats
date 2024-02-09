import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flash_eats/features/login/logic/cubit/login_cubit.dart';
import 'package:flash_eats/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:flash_eats/features/login/ui/widgets/email_and_password.dart';
import 'package:flash_eats/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flash_eats/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flash_eats/core/theming/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 30.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyles.font24OrangeBold,
                            ),
                            verticalSpace(8),
                            Text(
                              "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                              style: TextStyles.font16SteelGrayRegular,
                            ),
                            verticalSpace(32),
                            Column(
                              children: [
                                const EmailAndPassword(),
                                verticalSpace(16),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyles.font12OrangeRegular,
                                  ),
                                ),
                                verticalSpace(32),
                                AppTextButton(
                                  buttonText: "Login",
                                  textStyle: TextStyles.font18WhiteSemiBold,
                                  onPressed: () {
                                    validateThenDoLogin(context);
                                  },
                                ),
                                verticalSpace(32),
                                const TermsAndConditionsText(),
                                verticalSpace(32),
                                const DontHaveAccountText(),
                                const LoginBlocListener(),
                              ],
                            ),
                          ])))),
        ));
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
