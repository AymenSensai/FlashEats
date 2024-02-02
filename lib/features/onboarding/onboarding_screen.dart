import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding:
          EdgeInsets.only(top: 30.h, bottom: 30.h, right: 16.h, left: 16.h),
      child: Column(
        children: [
          Text(
            "Flash Eats",
            style: TextStyles.font32BlackRegular,
          ),
          SizedBox(height: 16.h),
          SvgPicture.asset('assets/svgs/onboarding_illustration.svg'),
          SizedBox(height: 30.h),
          Text(
            "Welcome to FlashEats",
            style: TextStyles.font32BlackBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            "Enjoy the best restaurants or get what you need from nearby stoeres, delivered",
            style: TextStyles.font18SteelGrayMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 86.h),
          AppTextButton(
              buttonText: "Get started",
              textStyle: TextStyles.font18WhiteSemiBold,
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              })
        ],
      ),
    ))));
  }
}
