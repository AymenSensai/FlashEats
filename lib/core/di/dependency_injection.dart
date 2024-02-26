import 'package:dio/dio.dart';
import 'package:flash_eats/core/networking/api_service.dart';
import 'package:flash_eats/core/networking/dio_factory.dart';
import 'package:flash_eats/features/details/data/repos/details_repo.dart';
import 'package:flash_eats/features/details/logic/cubit/details_cubit.dart';
import 'package:flash_eats/features/favorite/data/repos/favorite_repo.dart';
import 'package:flash_eats/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:flash_eats/features/home/data/repos/home_repo.dart';
import 'package:flash_eats/features/home/logic/cubit/food_type_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/home_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/location_cubit.dart';
import 'package:flash_eats/features/login/data/repos/login_repo.dart';
import 'package:flash_eats/features/login/logic/cubit/login_cubit.dart';
import 'package:flash_eats/features/profile/data/repos/profile_repo.dart';
import 'package:flash_eats/features/profile/logic/cubit/personal_information_cubit.dart';
import 'package:flash_eats/features/profile/logic/cubit/profile_cubit.dart';
import 'package:flash_eats/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:flash_eats/features/sign_up/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Dio & ApiService
  // Dio stripeDio = StripeDioFactory.getDio();
  // getIt.registerLazySingleton<StripeService>(() => StripeService(stripeDio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<LocationCubit>(() => LocationCubit());
  getIt.registerFactory<FoodTypeCubit>(() => FoodTypeCubit(getIt()));

  // details
  getIt.registerLazySingleton<DetailsRepo>(() => DetailsRepo(getIt()));
  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(getIt()));

  // favorite
  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt()));
  getIt.registerFactory<FavoriteCubit>(() => FavoriteCubit(getIt()));

  // profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  getIt.registerFactory<PersonalInformationCubit>(
      () => PersonalInformationCubit(getIt()));

  // cart
  // getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  // getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  // payment
  // getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt()));
  // getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt()));
}
