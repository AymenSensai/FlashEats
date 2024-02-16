import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/home/ui/widgets/custom_search_delegate.dart';
import 'package:flash_eats/features/home/ui/widgets/location_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String locationMessage;
  final List<FoodData> foodList;
  const HomeAppBar(
      {super.key, required this.locationMessage, required this.foodList});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 40,
        leading: GestureDetector(
          child: CircleAvatar(
            backgroundColor: ColorsManager.lightGray,
            radius: 20.0,
            child: InkWell(
              child: SvgPicture.asset(
                'assets/svgs/search_icon.svg',
              ),
            ),
          ),
          onTap: () {
            showSearch(
                context: context,
                delegate: CustomSearchDelegate(food: foodList));
          },
        ),
        actions: [
          CircleAvatar(
            backgroundColor: ColorsManager.lightGray,
            radius: 20.0,
            child: SvgPicture.asset('assets/svgs/cart_icon.svg'),
          ),
        ],
        title: Column(
          children: [
            Text(
              'Current location',
              style: TextStyles.font14BlackRegular,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/location_icon.svg'),
                locationBlocBuilder()
              ],
            )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
