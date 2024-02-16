import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/single_line_text.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularFoodListView extends StatelessWidget {
  final List<FoodData> foodList;

  const PopularFoodListView({Key? key, required this.foodList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular",
              style: TextStyles.font18BlackBold,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.foodScreen,
                    arguments: [foodList, "Popular"]);
              },
              child: Text(
                "see all",
                style: TextStyles.font16SteelGrayRegular,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
          height: 210.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                final food = foodList[index];
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                    child: Container(
                        width: 140.w,
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
                        child: GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.detailScreen);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                    child: context.networkImage(food.image,
                                        width: 150.h, height: 80.w),
                                  ),
                                  SingleLineText(
                                      text: food.name,
                                      style: TextStyles.font14BlackSemiBold),
                                  SingleLineText(
                                      text: food.description,
                                      style: TextStyles.font12SteelGrayRegular),
                                  verticalSpace(2),
                                  SingleLineText(
                                      text: food.price,
                                      style: TextStyles.font16OrangeSemiBold)
                                ],
                              ),
                            ))));
              })),
    ]);
  }
}
