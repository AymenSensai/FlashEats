import 'package:flash_eats/features/home/data/models/food_request_body.dart';
import 'package:flash_eats/features/home/logic/cubit/food_type_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_eats/features/home/data/repos/home_repo.dart';

class FoodTypeCubit extends Cubit<FoodTypeState> {
  final HomeRepo _homeRepo;
  FoodTypeCubit(this._homeRepo) : super(const FoodTypeState.initial());

  void emitFoodTypeState(String type) async {
    emit(const FoodTypeState.loading());
    final response = await _homeRepo.getFood(FoodRequestBody(type: type));
    response.when(success: (foodResponse) {
      emit(FoodTypeState.success(foodResponse));
    }, failure: (error) {
      emit(FoodTypeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
