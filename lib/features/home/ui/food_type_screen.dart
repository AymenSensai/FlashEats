import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/home/logic/cubit/food_type_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/food_type_state.dart';
import 'package:flash_eats/features/home/ui/widgets/food_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FoodTypeScreen extends StatefulWidget {
  final String type;
  const FoodTypeScreen({super.key, required this.type});

  @override
  State<FoodTypeScreen> createState() => _FoodTypeScreenState();
}

class _FoodTypeScreenState extends State<FoodTypeScreen> {
  List<FoodData> foodList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FoodTypeCubit>(context)
        .emitFoodTypeState(widget.type.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.type),
          centerTitle: true,
          forceMaterialTransparency: true),
      body:
          SafeArea(child: SingleChildScrollView(child: foodTypeBlocBuilder())),
    );
  }

  BlocBuilder<FoodTypeCubit, FoodTypeState<dynamic>> foodTypeBlocBuilder() {
    return BlocBuilder<FoodTypeCubit, FoodTypeState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SizedBox(height: 120.h),
                      );
                    },
                  ),
                ));
          },
          success: (homeResponse) {
            foodList = homeResponse.foodData ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FoodListView(foodList: foodList),
              ],
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
