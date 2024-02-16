import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FoodTypeView extends StatelessWidget {
  const FoodTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodType> foodTypeList = [
      FoodType(image: "assets/svgs/pizza_icon.svg", name: "Pizza"),
      FoodType(image: "assets/svgs/burger_icon.svg", name: "Burger"),
      FoodType(image: "assets/svgs/sandwich_icon.svg", name: "Sandwich"),
      FoodType(image: "assets/svgs/drinks_icon.svg", name: "Drinks")
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
          child: Text(
            "Categories",
            style: TextStyles.font18BlackBold,
          ),
        ),
        verticalSpace(8),
        SizedBox(
          height: 86.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              itemCount: foodTypeList.length,
              itemBuilder: (context, index) {
                final type = foodTypeList[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routes.foodTypeScreen,
                        arguments: type.name),
                    child: Container(
                      width: 74,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: ColorsManager.black.withOpacity(0.15),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(type.image),
                            verticalSpace(4),
                            Text(type.name,
                                style: TextStyles.font10BlackRegular)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class FoodType {
  String name;
  String image;
  FoodType({required this.name, required this.image});
}
