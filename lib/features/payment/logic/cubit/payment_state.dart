import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.freezed.dart';

@freezed
class PaymentState<T> with _$PaymentState<T> {
  const factory PaymentState.initial() = _Initial;

  const factory PaymentState.loading() = Loading;
  const factory PaymentState.success(T data) = Success<T>;
  const factory PaymentState.error({required String error}) = Error;
}
