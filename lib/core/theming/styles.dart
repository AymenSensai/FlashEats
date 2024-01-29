import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font32BlackRegular = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.black);

  static TextStyle font32BlackBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.black);

  static TextStyle font24BlackBold = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.black);

  static TextStyle font18GraykMedium = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.gray);

  static TextStyle font18WhiteSemiBold = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeightHelper.semiBold,
      color: Colors.white);

  static TextStyle font16GraykMedium = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManager.gray);
}
