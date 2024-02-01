import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font12BlackMedium,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font12OrangeSemiBold,
          ),
        ],
      ),
    );
  }
}
