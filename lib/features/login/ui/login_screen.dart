import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flash_eats/core/widgets/app_text_form_field.dart';
import 'package:flash_eats/features/login/ui/widgets/already_have_account_text.dart';
import 'package:flash_eats/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flash_eats/core/theming/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.h),
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
                        verticalSpace(48),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              AppTextFormField(
                                  prefixIcon: InkWell(
                                      child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                              "assets/svgs/email_icon.svg",
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      ColorsManager.steelGray,
                                                      BlendMode.srcIn)))),
                                  hintText: 'Email'),
                              verticalSpace(18),
                              AppTextFormField(
                                hintText: 'Password',
                                isObscureText: isObscureText,
                                prefixIcon: InkWell(
                                    child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                      "assets/svgs/password_icon.svg",
                                      colorFilter: const ColorFilter.mode(
                                          ColorsManager.steelGray,
                                          BlendMode.srcIn)),
                                )),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscureText = !isObscureText;
                                    });
                                  },
                                  child: Icon(
                                    isObscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: ColorsManager.steelGray,
                                  ),
                                ),
                              ),
                              verticalSpace(24),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyles.font12OrangeRegular,
                                ),
                              ),
                              verticalSpace(40),
                              AppTextButton(
                                buttonText: "Login",
                                textStyle: TextStyles.font18WhiteSemiBold,
                                onPressed: () {},
                              ),
                              verticalSpace(16),
                              const TermsAndConditionsText(),
                              verticalSpace(60),
                              const AlreadyHaveAccountText(),
                            ],
                          ),
                        )
                      ])))),
    );
  }
}
