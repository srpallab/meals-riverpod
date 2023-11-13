import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          filterSwitchSection(
            context,
            'Gluten-free',
            'Only include gluten-free meals.',
            (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            activeFilters[Filter.glutenFree]!,
          ),
          filterSwitchSection(
            context,
            'Lactose-free',
            'Only include lactose-free meals',
            (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            activeFilters[Filter.lactoseFree]!,
          ),
          filterSwitchSection(
            context,
            'Vegetarian',
            'Only include vegetarian meals.',
            (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            activeFilters[Filter.vegetarian]!,
          ),
          filterSwitchSection(
            context,
            'Vegan',
            'Only include vegan meals.',
            (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            activeFilters[Filter.vegan]!,
          ),
        ],
      ),
    );
  }

  SwitchListTile filterSwitchSection(
    BuildContext context,
    String title,
    String subTitle,
    void Function(bool)? onChanged,
    bool value,
  ) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
