import 'package:flutter/material.dart';
import 'package:flutter_meal_app/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_meal_app/models/meal.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Meal added as a favorite.'
                        : 'Meal removed.'),
                  ),
                );
                //onToggleFavorite(meal);
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween(
                      begin: 0.9,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
              ),
            ),
          ],
          title: Text(
            meal.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // SingleChildScroolView
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  fit: BoxFit.cover,
                  height: 300,
                  meal.imageUrl,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              const SizedBox(height: 24),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 14,
              ),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ));
  }
}
