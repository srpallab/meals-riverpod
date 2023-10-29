import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealsDetailsScreen extends StatelessWidget {
  final Meal meal;

  const MealsDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 14),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Text(
                step,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
