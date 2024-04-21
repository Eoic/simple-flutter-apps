import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  final String title;
  final String description;
  final bool isToggled;
  final void Function(bool isToggled) onToggle;

  const FilterSwitch({
    super.key,
    required this.title,
    required this.description,
    required this.isToggled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SwitchListTile(
      value: isToggled,
      onChanged: onToggle,
      title: Text(
        title,
        style: textTheme.titleLarge!
            .copyWith(color: colorScheme.onBackground),
      ),
      subtitle: Text(
        description,
        style: textTheme.labelMedium!
            .copyWith(color: colorScheme.onBackground),
      ),
      activeColor: colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
