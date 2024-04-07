import '../models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(BuildContext, Meal) onSelect;

  String get complexity {
    return "${meal.complexity.name[0].toUpperCase()}${meal.complexity.name.substring(1)}";
  }

  String get affordability {
    return "${meal.affordability.name[0].toUpperCase()}${meal.affordability.name.substring(1)}";
  }

  const MealItem({
    super.key,
    required this.meal,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () => onSelect(context, meal),
        child: Stack(
          children: [
            FadeInImage(
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
              image: NetworkImage(meal.imageUrl),
              placeholder: MemoryImage(kTransparentImage),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 45),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          label: '${meal.duration} min.',
                          icon: Icons.schedule,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          label: complexity,
                          icon: Icons.work,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          label: affordability,
                          icon: Icons.attach_money,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
