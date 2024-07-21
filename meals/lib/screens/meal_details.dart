import 'package:meals/providers/favorites.provider.dart';

import '../models/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    final ingredientsStyle = textTheme.titleLarge!.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    final ingredientStyle = textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onBackground,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref.read(favoriteMealsProvider.notifier).toggleFavoriteMeal(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(isAdded ? 'Meal added as favorite' : 'Meal removed as favorite')));
            },
            icon: isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: ingredientsStyle,
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: ingredientStyle,
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: ingredientsStyle,
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: ingredientStyle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
