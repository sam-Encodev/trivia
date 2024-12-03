import 'package:flutter/material.dart';
import 'package:trivia/providers/lean.dart';
import 'package:trivia/constants/spacing.dart';
import 'package:trivia/constants/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionQty extends ConsumerStatefulWidget {
  const QuestionQty({super.key});

  @override
  ConsumerState<QuestionQty> createState() => _QuestionQty();
}

class _QuestionQty extends ConsumerState<QuestionQty> {
  @override
  Widget build(BuildContext context) {
    final qty = ref.watch(questionQtyProvider);

    return Center(
      child: Wrap(
        spacing: screenPadding,
        children: qtyList.asMap().entries.map((entry) {
          return FilterChip(
            showCheckmark: false,
            label: Text(entry.value.toString()),
            selected: qty == entry.value,
            onSelected: (bool selected) {
              ref.read(questionQtyProvider.notifier).state = entry.value;
            },
          );
        }).toList(),
      ),
    );
  }
}
