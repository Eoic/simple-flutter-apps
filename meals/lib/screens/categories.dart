import 'package:flutter/material.dart';
import 'package:meals/data/mock_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;

  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  void _selectCategory(BuildContext context, Category category) {
    final categoryMeals = availableMeals
      .where((meal) => meal.categories.contains(category.id))
      .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: categoryMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: categories
          .map(
            (category) => CategoryGridItem(
              category: category,
              onSelect: _selectCategory,
            ),
          )
          .toList(),
    );
  }
}
