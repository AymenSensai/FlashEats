import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/features/authentication/ui/phone_registration_screen.dart';
import 'package:flash_eats/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (argument as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.phoneRegistration:
        return MaterialPageRoute(builder: (_) => const PhoneRegistration());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No route defined for ${settings.name}")),
                ));
    }
  }
}
