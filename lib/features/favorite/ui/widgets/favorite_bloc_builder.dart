import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/vertical_shimmer_list.dart';
import 'package:flash_eats/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:flash_eats/features/favorite/logic/cubit/favorite_state.dart';
import 'package:flash_eats/core/widgets/food_list_view.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteBlocBuilder extends StatefulWidget {
  const FavoriteBlocBuilder({super.key});

  @override
  State<FavoriteBlocBuilder> createState() => _FavoriteBlocBuilderState();
}

class _FavoriteBlocBuilderState extends State<FavoriteBlocBuilder> {
  late final List<FoodData> food;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () {
              return const VerticalShimmerList();
            },
            success: (response) {
              food = response.foodData ?? [];
              if (food.isNotEmpty) {
                return Expanded(
                    child: FoodListView(
                  foodList: food,
                  onPressed: (selectedFood) {
                    context
                        .read<FavoriteCubit>()
                        .deleteFavorite(selectedFood.id);
                  },
                  icon: SvgPicture.asset('assets/svgs/heart_solid_icon.svg'),
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
