import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.phoneRegistration);
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorsManager.mainOrange),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 52)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
      child: Text(
        "Get started",
        style: TextStyles.font18WhiteSemiBold,
      ),
    );
  }
}
