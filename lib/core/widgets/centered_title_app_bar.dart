import 'package:flash_eats/core/theming/styles.dart';
import 'package:flutter/material.dart';

AppBar centeredTitleAppBar(String text) {
  return AppBar(
    forceMaterialTransparency: true,
    centerTitle: true,
    title: Text(
      text,
      style: TextStyles.font18BlackBold,
    ),
  );
}
