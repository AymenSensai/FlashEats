import 'package:flash_eats/features/cart/data/models/cart_request_body.dart';
import 'package:flash_eats/features/cart/data/repos/cart_repo.dart';
import 'package:flash_eats/features/cart/logic/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(const CartState.initial(0));

  double price = 0;

  void emitCartStates() async {
    emit(const CartState.loading());
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await _cartRepo.getCartFood('token $token');
    response.when(success: (response) {
      price = response.data!.cartPrice;
      emit(CartState.success(response));
    }, failure: (error) {
      emit(CartState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void deleteCartStates(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response =
        await _cartRepo.deleteCartFood('token $token', CartRequestBody(id: id));
    response.when(success: (response) {
      emit(CartState.success(response));
    }, failure: (error) {
      emit(CartState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void priceChange(double newPrice) {
    price += newPrice;
    emit(CartState.initial(price));
  }
}
