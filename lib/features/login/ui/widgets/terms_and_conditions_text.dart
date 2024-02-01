import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.font12SteelGrayMedium,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyles.font12BlackMedium,
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.font12SteelGrayMedium.copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyles.font12BlackMedium,
          ),
        ],
      ),
    );
  }
}
