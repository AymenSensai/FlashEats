import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flash_eats/core/theming/styles.dart';

class PhoneRegistration extends StatelessWidget {
  const PhoneRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                      top: 30.h, bottom: 30.h, right: 16.h, left: 16.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                            'assets/svgs/phone_registration_illustration.svg'),
                        verticalSpace(32),
                        Text(
                          "Mobile number",
                          style: TextStyles.font24BlackBold,
                        ),
                        verticalSpace(2),
                        Text(
                          "We’ll use your number only if we need to contact you about your order.",
                          style: TextStyles.font16GraykMedium,
                        ),
                        verticalSpace(48),
                        Row(children: <Widget>[
                          Container(
                            width: 80.w,
                            height: 64, // Adjust the width as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Rounded corners
                              color: ColorsManager
                                  .lightGray, // Filled background color
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: <Widget>[
                                  Text('+213'),
                                  Icon(Icons.arrow_drop_down), // Suffix icon
                                ],
                              ),
                            ),
                          ),
                          horizontalSpace(
                              8), // Add some space between the fields
                          Expanded(
                            child: TextFormField(
                              maxLength: 10,
                              cursorColor: ColorsManager.mainOrange,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: 'Phone number',
                                  filled: true,
                                  fillColor: ColorsManager.lightGray,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  counterText: ''),
                            ),
                          ),
                        ]),
                        verticalSpace(60),
                        AppTextButton(
                            buttonText: "Get started",
                            textStyle: TextStyles.font18WhiteSemiBold,
                            onPressed: () {
                              context.pushNamed(Routes.otpVerification);
                            })
                      ])))),
    );
  }
}
