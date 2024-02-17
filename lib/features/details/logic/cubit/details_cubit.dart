import 'package:flash_eats/features/details/data/models/details_request_body.dart';
import 'package:flash_eats/features/details/data/repos/details_repo.dart';
import 'package:flash_eats/features/details/logic/cubit/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsRepo _detailsRepo;
  DetailsCubit(this._detailsRepo) : super(const DetailsState.initial());

  void emitDetailsStates(int id) async {
    emit(const DetailsState.loading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await _detailsRepo.containsFavorite(
        'token $token', DetailsRequestBody(id: id));
    response.when(success: (response) {
      emit(DetailsState.success(response));
    }, failure: (error) {
      emit(DetailsState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void addFavorite(int id) async {
    emit(const DetailsState.loading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await _detailsRepo.addFavorite(
        'token $token', DetailsRequestBody(id: id));
    response.when(success: (foodResponse) {
      emit(DetailsState.success(foodResponse));
    }, failure: (error) {
      emit(DetailsState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void deleteFavorite(int id) async {
    emit(const DetailsState.loading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await _detailsRepo.deleteFavorite(
        'token $token', DetailsRequestBody(id: id));
    response.when(success: (foodResponse) {
      emit(DetailsState.success(foodResponse));
    }, failure: (error) {
      emit(DetailsState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
