import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/features/home/ui/widgets/food_list_view.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<FoodData> food;

  CustomSearchDelegate({required this.food});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<FoodData> searchedFood = food
        .where((food) => food.name.toLowerCase().startsWith(query))
        .toList();
    return SingleChildScrollView(child: FoodListView(foodList: searchedFood));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<FoodData> searchedFood = food
        .where((food) => food.name.toLowerCase().startsWith(query))
        .toList();
    return SingleChildScrollView(child: FoodListView(foodList: searchedFood));
  }
}
