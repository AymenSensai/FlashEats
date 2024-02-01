import 'package:flash_eats/core/di/dependency_injection.dart';
import 'package:flash_eats/core/routing/app_router.dart';
import 'package:flash_eats/flash_eats_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(FlashEatsApp(appRouter: AppRouter()));
}
