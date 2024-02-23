import 'package:flash_eats/features/profile/data/models/personal_information_request_body.dart';
import 'package:flash_eats/features/profile/data/repos/profile_repo.dart';
import 'package:flash_eats/features/profile/logic/cubit/personal_information_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInformationCubit extends Cubit<PersonalInformationState> {
  final ProfileRepo _profileRepo;
  PersonalInformationCubit(this._profileRepo)
      : super(const PersonalInformationState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const PersonalInformationState.loading());
    final response = await _profileRepo.update(
      PersonalInformationRequestBody(
        username: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (signupResponse) {
      emit(PersonalInformationState.success(signupResponse));
    }, failure: (error) {
      emit(PersonalInformationState.error(
          error: error.apiErrorModel.message ?? ''));
    });
  }
}
