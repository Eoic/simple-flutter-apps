import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/filter_switch.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;

  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  _selectScreen(String screenId) {
    Navigator.of(context).pop();

    if (screenId == 'meals') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const TabsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }

          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterSwitch(
              title: 'Gluten-free',
              description: 'Only include gluten-free meals.',
              isToggled: _glutenFreeFilterSet,
              onToggle: (isChecked) => setState(() => _glutenFreeFilterSet = isChecked),
            ),
            FilterSwitch(
              title: 'Lactose-free',
              description: 'Only include lactose-free meals.',
              isToggled: _lactoseFreeFilterSet,
              onToggle: (isChecked) => setState(() => _lactoseFreeFilterSet = isChecked),
            ),
            FilterSwitch(
              title: 'Vegetarian',
              description: 'Only include vegetarian meals.',
              isToggled: _vegetarianFilterSet,
              onToggle: (isChecked) => setState(() => _vegetarianFilterSet = isChecked),
            ),
            FilterSwitch(
              title: 'Vegan',
              description: 'Only include vegan meals.',
              isToggled: _veganFilterSet,
              onToggle: (isChecked) => setState(() => _veganFilterSet = isChecked),
            ),
          ],
        ),
      ),
    );
  }
}
