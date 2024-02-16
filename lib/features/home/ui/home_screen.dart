import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/routing/routes.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/home/logic/cubit/home_cubit.dart';
import 'package:flash_eats/features/home/logic/cubit/home_state.dart';
import 'package:flash_eats/features/home/logic/cubit/location_cubit.dart';
import 'package:flash_eats/features/home/ui/widgets/food_list_view.dart';
import 'package:flash_eats/features/home/ui/widgets/food_type_view.dart';
import 'package:flash_eats/features/home/ui/widgets/home_app_bar.dart';
import 'package:flash_eats/features/home/ui/widgets/popular_food_List_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String locationMessage = '';
  List<FoodData> foodList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).emitHomeStates();
    BlocProvider.of<LocationCubit>(context).getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(locationMessage: locationMessage, foodList: foodList),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 0.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FoodTypeView(),
                        verticalSpace(16),
                        // const PopularFoodListView(),
                        // verticalSpace(16),
                        BlocBuilder<HomeCubit, HomeState>(
                          buildWhen: (previous, current) =>
                              current is Loading ||
                              current is Success ||
                              current is Error,
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Card(
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                      ),
                                                      child: SizedBox(
                                                          height: 30.h,
                                                          width: 180.w)))),
                                          SizedBox(
                                              child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Card(
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                      child: SizedBox(
                                                          height: 20.h,
                                                          width: 80.w)))),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height: 210.h,
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 6,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 8.0),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: Card(
                                                  elevation: 1.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: SizedBox(width: 140.w),
                                                ),
                                              );
                                            },
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Card(
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                      ),
                                                      child: SizedBox(
                                                          height: 30.h,
                                                          width: 180.w)))),
                                          SizedBox(
                                              child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Card(
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                      child: SizedBox(
                                                          height: 20.h,
                                                          width: 80.w)))),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
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
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: SizedBox(height: 120.h),
                                              );
                                            },
                                          ),
                                        )),
                                  ],
                                );

                                // return Container();
                              },
                              success: (homeResponse) {
                                foodList = homeResponse.foodData ?? [];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PopularFoodListView(foodList: foodList),
                                    verticalSpace(16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Top of the week",
                                            style: TextStyles.font18BlackBold,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.pushNamed(
                                                  Routes.foodScreen,
                                                  arguments: [
                                                    foodList,
                                                    "Top of the week"
                                                  ]);
                                            },
                                            child: Text(
                                              "see all",
                                              style: TextStyles
                                                  .font16SteelGrayRegular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FoodListView(foodList: foodList),
                                  ],
                                );
                              },
                              orElse: () => Container(),
                            );
                          },
                        )
                      ])))),
    );
  }
}
