import 'package:flash_eats/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor:
                ColorsManager.lightGray, // Set the background color here
            radius: 24.0, // Adjust padding as needed
            child: SvgPicture.asset('assets/svgs/google_icon.svg'),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor:
                ColorsManager.lightGray, // Set the background color here
            radius: 24.0, // Adjust padding as needed
            child: SvgPicture.asset('assets/svgs/facebook_icon.svg'),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor:
                ColorsManager.lightGray, // Set the background color here
            radius: 24.0, // Adjust padding as needed
            child: SvgPicture.asset('assets/svgs/apple_icon.svg'),
          ),
        ],
      ),
    );
  }
}
