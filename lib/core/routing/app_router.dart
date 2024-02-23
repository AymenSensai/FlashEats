import 'package:flash_eats/core/di/dependency_injection.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/features/details/logic/cubit/details_cubit.dart';
import 'package:flash_eats/features/details/ui/details_screen.dart';
import 'package:flash_eats/features/home/logic/cubit/food_type_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/home_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/location_cubit.dart';
import 'package:flash_eats/features/home/ui/food_screen.dart';
import 'package:flash_eats/features/home/ui/food_type_screen.dart';
import 'package:flash_eats/features/home/ui/home_screen.dart';
import 'package:flash_eats/features/login/ui/login_screen.dart';
import 'package:flash_eats/features/onboarding/onboarding_screen.dart';
import 'package:flash_eats/features/profile/logic/cubit/personal_information_cubit.dart';
import 'package:flash_eats/features/profile/ui/personal_information_screen.dart';
import 'package:flash_eats/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flash_eats/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_eats/features/login/logic/cubit/login_cubit.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (argument as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.foodTypeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FoodTypeCubit>(),
            child: FoodTypeScreen(type: arguments as String),
          ),
        );
      case Routes.foodScreen:
        final argumentsList = arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (_) =>
              FoodScreen(food: argumentsList[0], title: argumentsList[1]),
        );

      case Routes.personalInformationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PersonalInformationCubit>(),
            child: const PersonalInformationScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => getIt<HomeCubit>(),
              ),
              BlocProvider(
                create: (BuildContext context) => getIt<LocationCubit>(),
              )
            ],
            child: const HomeScreen(),
          ),
        );
      case Routes.detailsScreen:
        final argumentsList = arguments as List<dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DetailsCubit>(),
            child: DetailsScreen(
                food: argumentsList[0], heroTag: argumentsList[1]),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No route defined for ${settings.name}")),
                ));
    }
  }
}
