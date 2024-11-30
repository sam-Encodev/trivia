import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/providers/categories.dart';

enum ExerciseFilter { walking, running, cycling, hiking }

class CategoryFilter extends ConsumerStatefulWidget {
  const CategoryFilter({super.key});

  @override
  ConsumerState<CategoryFilter> createState() => _CategoryFilter();
}

class _CategoryFilter extends ConsumerState<CategoryFilter> {
  Set filters = {};

  @override
  Widget build(BuildContext context) {
    final getCategories = ref.watch(categoryNotifierProvider);

    return Center(
      child: Wrap(
   spacing: 10,
        children: getCategories.asMap().entries.map((entry) {
          return FilterChip(
            showCheckmark: false,
            label: Text(entry.value.name),
            selected: filters.contains(entry.value.name),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  filters.add(entry.value.name);
                } else {
                  filters.remove(entry.value.name);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
