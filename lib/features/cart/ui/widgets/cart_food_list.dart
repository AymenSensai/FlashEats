import 'package:flash_eats/features/cart/data/models/cart_response.dart';
import 'package:flash_eats/features/cart/ui/widgets/cart_food_item.dart';
import 'package:flutter/material.dart';

class CartFoodList extends StatelessWidget {
  final List<CartData> foodList;

  const CartFoodList({Key? key, required this.foodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: foodList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      itemBuilder: (context, index) {
        final cart = foodList[index];
        return CartFoodItem(cart: cart);
      },
    );
  }
}
