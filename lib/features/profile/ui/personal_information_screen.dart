import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flash_eats/core/widgets/centered_title_app_bar.dart';
import 'package:flash_eats/features/profile/ui/widgets/personal_information_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationStateScreen();
}

class _PersonalInformationStateScreen extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centeredTitleAppBar("Personal Information"),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: Column(
            children: [
              const PersonalInformationForm(),
              verticalSpace(32),
              AppTextButton(
                buttonText: "Login",
                textStyle: TextStyles.font18WhiteSemiBold,
                onPressed: () {
                  // validateThenDoLogin(context);
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
