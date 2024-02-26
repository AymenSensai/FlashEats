import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/vertical_shimmer_list.dart';
import 'package:flash_eats/features/cart/data/models/cart_response.dart';
import 'package:flash_eats/features/cart/logic/cubit/cart_cubit.dart';
import 'package:flash_eats/features/cart/logic/cubit/cart_state.dart';
import 'package:flash_eats/features/cart/ui/widgets/cart_food_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartBlocBuilder extends StatefulWidget {
  const CartBlocBuilder({super.key, required this.onPriceChange});

  final Function(double) onPriceChange;

  @override
  State<CartBlocBuilder> createState() => _CartBlocBuilderState();
}

class _CartBlocBuilderState extends State<CartBlocBuilder> {
  List<CartData> food = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return const VerticalShimmerList();
            },
            success: (response) {
              final data = response.data ?? [];
              widget.onPriceChange(data.cartPrice);
              food = data.cart;
              if (food.isNotEmpty) {
                return Expanded(
                    child: CartFoodList(
                  foodList: food,
                ));
              } else {
                return Padding(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 48.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/favorite_empty_icon.svg',
                        height: 200.h,
                        width: 200.w,
                      ),
                      Text(
                        'Seems like you don’t have favorite food yet! You will find them when you choose them.',
                        style: TextStyles.font18BlackMedium,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              }
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}
