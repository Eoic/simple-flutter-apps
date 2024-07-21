import 'package:flutter/material.dart';
import 'package:meals/widgets/filter_switch.dart';
import 'package:meals/providers/filters.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body:
        Column(
          children: [
            FilterSwitch(
              title: 'Gluten-free',
              description: 'Only include gluten-free meals.',
              isToggled: filters[Filter.glutenFree]!,
              onToggle: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked),
            ),
            FilterSwitch(
              title: 'Lactose-free',
              description: 'Only include lactose-free meals.',
              isToggled: filters[Filter.lactoseFree]!,
              onToggle: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked),
            ),
            FilterSwitch(
              title: 'Vegetarian',
              description: 'Only include vegetarian meals.',
              isToggled: filters[Filter.vegetarian]!,
              onToggle: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked),
            ),
            FilterSwitch(
              title: 'Vegan',
              description: 'Only include vegan meals.',
              isToggled: filters[Filter.vegan]!,
              onToggle: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked),
            ),
          ],
        ),
      );
  }
}
