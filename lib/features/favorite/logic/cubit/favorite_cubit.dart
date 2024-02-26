import 'package:flash_eats/features/details/data/models/details_request_body.dart';
import 'package:flash_eats/features/favorite/data/repos/favorite_repo.dart';
import 'package:flash_eats/features/favorite/logic/cubit/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;
  FavoriteCubit(this._favoriteRepo) : super(const FavoriteState.initial());

  void emitFavoriteStates() async {
    emit(const FavoriteState.loading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await _favoriteRepo.getFavorites('token $token');
    response.when(success: (response) {
      emit(FavoriteState.success(response));
    }, failure: (error) {
      emit(FavoriteState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void deleteFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await _favoriteRepo.deleteFavorite(
        'token $token', DetailsRequestBody(id: id));
    response.when(success: (foodResponse) {
      emit(const FavoriteState.favoriteRemoved());
    }, failure: (error) {
      emit(FavoriteState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
