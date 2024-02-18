import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flash_eats/core/widgets/food_list_view.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  final List<FoodData> food;
  final String title;
  const FoodScreen({super.key, required this.food, required this.title});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          forceMaterialTransparency: true),
      body: SafeArea(
          child: SingleChildScrollView(
              child: FoodListView(foodList: widget.food))),
    );
  }
}
