import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../widgets/category_grid_item.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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

    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) => SlideTransition(
        position: _animationController.drive(
          Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ),
        ),
        child: child,
        // child: Padding(
        //   padding: EdgeInsets.only(
        //   top: 100 - _animationController.value * 100),
        //   child: child,
        // ),
      ),
      child: GridView.builder(
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
      ),
    );
  }
}
