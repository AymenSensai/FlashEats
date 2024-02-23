import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_information_state.freezed.dart';

@freezed
class PersonalInformationState<T> with _$PersonalInformationState<T> {
  const factory PersonalInformationState.initial() = _Initial;

  const factory PersonalInformationState.loading() = Loading;
  const factory PersonalInformationState.success(T data) = Success<T>;
  const factory PersonalInformationState.error({required String error}) = Error;
}
