import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/single_line_text.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodListView extends StatelessWidget {
  final List<FoodData> foodList;

  const FoodListView({Key? key, required this.foodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: foodList.length,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          itemBuilder: (context, index) {
            final food = foodList[index];
            final heroTag = 'food_hero_${food.id}';
            return GestureDetector(
              onTap: () {
                context.pushNamed(Routes.detailsScreen,
                    arguments: [food, heroTag]);
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
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
                              child: context.networkImage(food.image,
                                  width: 150.h, height: 100.w),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SingleLineText(
                                      text: food.name,
                                      style: TextStyles.font22BlackSemiBold),
                                  SingleLineText(
                                      text: food.description,
                                      style: TextStyles.font14SteelGrayRegular),
                                  verticalSpace(2),
                                  SingleLineText(
                                      text: food.price,
                                      style: TextStyles.font18OrangeSemiBold)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
