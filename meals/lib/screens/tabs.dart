import 'package:flutter/material.dart';
import 'package:meals/data/mock_data.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

import '../models/meal.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index);
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavourite(Meal meal) {
    setState(() {
      if (_favouriteMeals.contains(meal)) {
        _favouriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer saved as favourite.');
        return;
      }

      _favouriteMeals.add(meal);
      _showInfoMessage('Meal is saved as favourite.');
    });
  }

  void _setScreen(String screenId) async {
    Navigator.of(context).pop();

    switch (screenId) {
      case 'filters':
        final filters = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
            builder: (context) => FiltersScreen(
              currentFilters: _selectedFilters,
            ),
          ),
        );

        setState(() => _selectedFilters = filters ?? kInitialFilters);
        break;
      case 'meals':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();

    String activePageTitle = 'Categories';
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
      onToggleFavourite: _toggleMealFavourite,
    );

    if (_selectedPageIndex == 1) {
      activePageTitle = 'Favourites';
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavourite,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectItem: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (int index) => _selectPage(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
