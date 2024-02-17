import 'package:flash_eats/core/di/dependency_injection.dart';
import 'package:flash_eats/core/routing/app_router.dart';
import 'package:flash_eats/flash_eats_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));

  // Show the splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  int onboardingStatus = prefs.getInt('onboarding') ?? 0;

  // Hide the splash screen once initialization is completed
  FlutterNativeSplash.remove();

  runApp(
      FlashEatsApp(appRouter: AppRouter(), onboardingStatus: onboardingStatus));
}
