import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/home/logic/cubit/home_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/home_state.dart';
import 'package:flash_eats/features/home/ui/widgets/food_list_view.dart';
import 'package:flash_eats/features/home/ui/widgets/popular_food_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildBlockWidget() {
  List<FoodData> foodList = [];

  return BlocBuilder<HomeCubit, HomeState>(
    buildWhen: (previous, current) =>
        current is Loading || current is Success || current is Error,
    builder: (context, state) {
      return state.maybeWhen(
        loading: () {
          return Container();
          // showDialog(
          //   context: context,
          //   builder: (context) => const Center(
          //     child: CircularProgressIndicator(
          //       color: ColorsManager.mainOrange,
          //     ),
          //   ),
          // );
        },
        success: (homeResponse) {
          foodList = homeResponse.foodData ?? [];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopularFoodListView(foodList: foodList),
              verticalSpace(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Top of the week",
                  style: TextStyles.font18BlackBold,
                ),
              ),
              verticalSpace(8),
              FoodListView(foodList: foodList),
            ],
          );
        },
        orElse: () => Container(),
      );
    },
  );
}
