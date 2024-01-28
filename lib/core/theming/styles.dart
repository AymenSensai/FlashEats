import 'package:flash_eats/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font32BlackNormal = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.normal,
      color: ColorsManager.black);

  static TextStyle font32BlackBold = TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.bold, color: ColorsManager.black);

  static TextStyle font18GraykMedium = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: ColorsManager.gray);

  static TextStyle font18WhiteSemiBold = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white);
}
