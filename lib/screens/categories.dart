import 'package:flutter/material.dart';

import 'package:flutter_meal_app/data/dummy_data.dart';
import 'package:flutter_meal_app/models/category.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/meals.dart';
import 'package:flutter_meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

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
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: filteredMeals),
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
