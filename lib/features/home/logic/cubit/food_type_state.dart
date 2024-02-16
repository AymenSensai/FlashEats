import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_type_state.freezed.dart';

@freezed
class FoodTypeState<T> with _$FoodTypeState<T> {
  const factory FoodTypeState.initial() = _Initial;

  const factory FoodTypeState.loading() = Loading;
  const factory FoodTypeState.success(T data) = Success<T>;
  const factory FoodTypeState.error({required String error}) = Error;
}
