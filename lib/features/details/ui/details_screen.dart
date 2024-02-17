import 'package:flash_eats/core/helpers/extensions.dart';
import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/core/widgets/app_text_button.dart';
import 'package:flash_eats/features/details/ui/widgets/favorite_bloc_listener.dart';
import 'package:flash_eats/features/details/ui/widgets/topic_list.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

class DetailsScreen extends StatefulWidget {
  final FoodData food;
  final String heroTag;
  const DetailsScreen({super.key, required this.food, required this.heroTag});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: AppTextButton(
            buttonText: "Add to Order",
            textStyle: TextStyles.font18WhiteSemiBold,
            onPressed: () {}),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back)),
                      FavoriteBlocListener(id: food.id),
                    ],
                  ),
                  Center(
                      child: Hero(
                          tag: widget.heroTag,
                          child: context.networkImage(food.image,
                              height: 250.h, width: 250.w))),
                  FadeInUp(
                    delay: const Duration(milliseconds: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: TextStyles.font22BlackSemiBold,
                            ),
                            Text(
                              food.description,
                              style: TextStyles.font14SteelGrayRegular,
                            )
                          ],
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: TextStyles.font16OrangeMedium,
                              ),
                              TextSpan(
                                text: food.price,
                                style: TextStyles.font24BlackMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSpace(10),
                  FadeInUp(
                    delay: const Duration(milliseconds: 50),
                    child: Text(
                      "Would you like any extra ?",
                      style: TextStyles.font16BlackMedium,
                    ),
                  ),
                  FadeInUp(
                      delay: const Duration(milliseconds: 50),
                      child: TopicList(topics: food.topicsExtra)),
                  FadeInUp(
                    delay: const Duration(milliseconds: 50),
                    child: Text(
                      "What do you want to remove ?",
                      style: TextStyles.font16BlackMedium,
                    ),
                  ),
                  FadeInUp(
                      delay: const Duration(milliseconds: 50),
                      child: TopicList(topics: food.topicsToRemove)),
                  verticalSpace(108.h)
                ],
              ))),
    );
  }
}
