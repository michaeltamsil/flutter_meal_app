import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/meal_details.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          // const SizedBox(height: 16),
          Text(
            'Try selecting a different cateogyr!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeail: (meal) {
            selectMeal(context, meal);
          },
        ),
        itemCount: meals.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // body: meals.map((meal) {}).toList());
      body: content,
    );
  }
}
