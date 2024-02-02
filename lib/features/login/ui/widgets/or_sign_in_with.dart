import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: ColorsManager.cloudGray,
            height: 20,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or sign in with',
            style: TextStyles.font12SteelGrayRegular,
          ),
        ),
        const Expanded(
          child: Divider(
            color: ColorsManager.cloudGray,
            height: 20,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
