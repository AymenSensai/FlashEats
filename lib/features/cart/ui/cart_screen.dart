import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flash_eats/core/widgets/centered_title_app_bar.dart';
import 'package:flash_eats/core/widgets/vertical_shimmer_list.dart';
import 'package:flash_eats/features/cart/data/models/cart_response.dart';
import 'package:flash_eats/features/cart/logic/cubit/cart_cubit.dart';
import 'package:flash_eats/features/cart/logic/cubit/cart_state.dart';
import 'package:flash_eats/features/cart/ui/widgets/cart_food_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartData> food = [];

  @override
  void initState() {
    context.read<CartCubit>().emitCartStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 92.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Price",
                      style: TextStyles.font18SteelGrayBold,
                    ),
                    Text(
                      '\$${context.watch<CartCubit>().price.toStringAsFixed(2)}',
                      style: TextStyles.font24GreenBold,
                    ),
                  ],
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: AppTextButton(
                    buttonText: "Check out",
                    textStyle: TextStyles.font18WhiteSemiBold,
                    onPressed: () {
                      context.pushNamed(Routes.payment,
                          arguments: context.read<CartCubit>().price);
                    }),
              ),
            ],
          ),
        ),
        appBar: centeredTitleAppBar("Cart"),
        body: SafeArea(child: cartBlocBuilder()));
  }

  Widget cartBlocBuilder() {
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
