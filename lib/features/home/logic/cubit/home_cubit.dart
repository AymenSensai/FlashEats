import 'package:flash_eats/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_eats/features/home/data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  // void emitHomeStates() async {
  //   emit(const HomeState.loading());
  //   final response = await _homeRepo.getFood(FoodRequestBody());
  //   response.when(success: (foodResponse) {
  //     emit(HomeState.success(foodResponse));
  //   }, failure: (error) {
  //     emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
  //   });
  // }

  void emitHomeStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.getPopularFood();
    response.when(success: (foodResponse) {
      emit(HomeState.success(foodResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
