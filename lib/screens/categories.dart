import 'package:flutter/material.dart';

import 'package:flutter_meal_app/data/dummy_data.dart';
import 'package:flutter_meal_app/models/category.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/meals.dart';
import 'package:flutter_meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(16),
      children: [
        // availableCategories.map((category) => CategoryGridItem(cateogry: category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              }),
      ],
    );
  }
}
