import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/single_line_text.dart';
import 'package:flash_eats/features/cart/data/models/cart_response.dart';
import 'package:flash_eats/features/cart/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFoodItem extends StatefulWidget {
  const CartFoodItem({super.key, required this.cart});

  final CartData cart;

  @override
  State<CartFoodItem> createState() => _CartFoodItemState();
}

class _CartFoodItemState extends State<CartFoodItem> {
  late int number;

  @override
  void initState() {
    final cart = widget.cart;
    number = cart.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;
    final heroTag = 'food_hero_${cart.food.id}';
    return GestureDetector(
      onTap: () {
        context
            .pushNamed(Routes.detailsScreen, arguments: [cart.food, heroTag]);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF535353).withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: heroTag,
                        child: context.networkImage(cart.food.image,
                            width: 150.h, height: 100.w),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SingleLineText(
                                    text: cart.food.name,
                                    style: TextStyles.font22BlackSemiBold),
                                GestureDetector(
                                  onTap: () => context
                                      .read<CartCubit>()
                                      .deleteCartStates(cart.id),
                                  child: const CircleAvatar(
                                      backgroundColor: ColorsManager.lightGray,
                                      radius: 12.0,
                                      child: InkWell(
                                        child: Icon(
                                          Icons.delete,
                                          color: ColorsManager.black,
                                          size: 16,
                                        ),
                                      )),
                                )
                              ],
                            ),
                            SingleLineText(
                                text: cart.food.description,
                                style: TextStyles.font14SteelGrayRegular),
                            verticalSpace(2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (number > 1) {
                                          setState(() {
                                            number--;
                                          });
                                          context
                                              .read<CartCubit>()
                                              .priceChange(-cart.food.price);
                                        }
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor:
                                            ColorsManager.lightGray,
                                        radius: 12.0,
                                        child: InkWell(
                                          child: Icon(
                                            Icons.remove,
                                            color: ColorsManager.black,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    horizontalSpace(16),
                                    Text(
                                      number.toString(),
                                      style: TextStyles.font24BlackMedium,
                                    ),
                                    horizontalSpace(16),
                                    GestureDetector(
                                      onTap: () {
                                        if (number < 10) {
                                          setState(() {
                                            number++;
                                          });
                                          context
                                              .read<CartCubit>()
                                              .priceChange(cart.food.price);
                                        }
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor:
                                            ColorsManager.lightGray,
                                        radius: 12.0,
                                        child: InkWell(
                                          child: Icon(
                                            Icons.add,
                                            color: ColorsManager.black,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SingleLineText(
                                    text: "\$${cart.food.price}",
                                    style: TextStyles.font18OrangeSemiBold)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
