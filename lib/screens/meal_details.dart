import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
      ),
      body: Image.network(
        fit: BoxFit.cover,
        height: 300,
        meal.imageUrl,
        width: double.infinity,
      ),
    );
  }
}
