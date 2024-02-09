import 'package:flash_eats/core/di/dependency_injection.dart';
import 'package:flash_eats/core/routing/app_router.dart';
import 'package:flash_eats/flash_eats_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(FlashEatsApp(appRouter: AppRouter()));
}
