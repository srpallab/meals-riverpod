import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../widgets/category_grid_item.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onCategorySelected(BuildContext context, Category category) {
      final filteredMeals = dummyMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) =>
              MealsScreen(title: category.title, meals: filteredMeals),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            onCategorySelected(context, availableCategories[index]);
          },
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: CategoryGridItem(category: availableCategories[index]),
        );
      },
    );
  }
}
