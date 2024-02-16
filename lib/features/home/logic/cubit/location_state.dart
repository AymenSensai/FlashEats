import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState<T> with _$LocationState<T> {
  const factory LocationState.initial() = _Initial;

  const factory LocationState.success(T data) = Success<T>;
  const factory LocationState.error({required String error}) = Error;
}
