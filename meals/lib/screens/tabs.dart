import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/favorites.provider.dart';
import 'package:meals/providers/filters.provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index);
  }

  void _setScreen(String screenId) async {
    Navigator.of(context).pop();

    switch (screenId) {
      case 'filters':
        await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (context) => const FiltersScreen()),
        );
        break;
      case 'meals':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(filteredMealsProvider);

    String activePageTitle = 'Categories';
    Widget activePage = CategoriesScreen(availableMeals: meals);

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle = 'Favourites';
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
