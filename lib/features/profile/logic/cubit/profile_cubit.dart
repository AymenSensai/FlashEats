import 'package:flash_eats/features/profile/data/repos/profile_repo.dart';
import 'package:flash_eats/features/profile/logic/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  void logout() async {
    emit(const ProfileState.loading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await _profileRepo.logout('token $token');
    response.when(success: (response) {
      emit(ProfileState.success(response));
    }, failure: (error) {
      emit(ProfileState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
