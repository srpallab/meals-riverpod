import 'package:flutter/material.dart';
import 'package:meals_riverpod/screens/meals_details_screen.dart';
import 'package:meals_riverpod/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  const MealsScreen({super.key, this.title, required this.meals});

  onMealSelected(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => MealsDetailsScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Oh no..Nothing to show here!",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            "Try selecting different category!",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
            onMealSelected: (Meal meal) => onMealSelected(context, meal),
          );
        },
      );
    }

    if (title == null) return content;
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
