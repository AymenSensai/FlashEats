import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget profileRowItem(
    {required String icon,
    required String text,
    required VoidCallback onClick,
    Color? iconColor,
    TextStyle? style}) {
  return InkWell(
    onTap: () => onClick(),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 32.h,
            width: 32.w,
            colorFilter: ColorFilter.mode(
                iconColor ?? ColorsManager.black, BlendMode.srcIn),
          ),
          horizontalSpace(16),
          Text(
            text,
            style: style ?? TextStyles.font16BlackMedium,
          )
        ],
      ),
    ),
  );
}
