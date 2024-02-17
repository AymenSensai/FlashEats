import 'package:flash_eats/core/routing/app_router.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/widgets/bottom_bar.dart';
import 'package:flash_eats/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashEatsApp extends StatelessWidget {
  final AppRouter appRouter;
  final int onboardingStatus;

  const FlashEatsApp(
      {super.key, required this.appRouter, required this.onboardingStatus});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flash Eats',
            theme: ThemeData(
                primaryColor: ColorsManager.mainOrange,
                scaffoldBackgroundColor: Colors.white),
            onGenerateRoute: appRouter.generateRoute,
            home: onboardingStatus == 0
                ? const OnboardingScreen()
                : const BottomNavigation()));
  }
}
