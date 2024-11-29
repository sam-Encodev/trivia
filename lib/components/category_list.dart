import 'package:flutter/material.dart';
import 'package:trivia/providers/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryList extends ConsumerStatefulWidget {
  const CategoryList({super.key});

  @override
  ConsumerState<CategoryList> createState() => _CategoryList();
}

class _CategoryList extends ConsumerState<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final getCategories = ref.watch(categoryNotifierProvider);

    return Wrap(
      spacing: 10,
      children: getCategories.asMap().entries.map((entry) {
        return InputChip(
          label: Text(
            textAlign: TextAlign.center,
            entry.value.name,
          ),
          showCheckmark: true,
          onSelected: (bool selected) {
            setState(() {});
          },
        );
      }).toList(),
    );
  }
}
