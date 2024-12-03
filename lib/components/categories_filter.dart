import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/constants/questions.dart';
import 'package:trivia/providers/categories.dart';

class CategoryFilter extends ConsumerStatefulWidget {
  const CategoryFilter({super.key});

  @override
  ConsumerState<CategoryFilter> createState() => _CategoryFilter();
}

class _CategoryFilter extends ConsumerState<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    final getCategories = ref.watch(categoryNotifierProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Wrap(
          spacing: 10,
          children: categoryList.asMap().entries.map((entry) {
            return FilterChip(
              showCheckmark: false,
              label: Text(entry.value),
              selected: getCategories.contains(entry.value),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    ref
                        .read(categoryNotifierProvider.notifier)
                        .add(entry.value);
                  } else {
                    ref
                        .read(categoryNotifierProvider.notifier)
                        .remove(entry.value);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
