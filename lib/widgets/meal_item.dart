import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeail});

  final Meal meal;
  final void Function(Meal meal) onSelectMeail;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        elevation: 8,
        margin: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        child: InkWell(
          onTap: () {
            onSelectMeail(meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                image: NetworkImage(meal.imageUrl),
                placeholder: MemoryImage(kTransparentImage),
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 44,
                  ),
                  child: Column(children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Very long text ...
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        )
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
