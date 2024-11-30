import 'package:flutter/material.dart';

const qty = [5, 10, 15, 20, 30];

class QuestionQty extends StatefulWidget {
  const QuestionQty({super.key});

  @override
  State<QuestionQty> createState() => _QuestionQty();
}

class _QuestionQty extends State<QuestionQty> {
  int? _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 5.0,
        children: qty.asMap().entries.map((entry) {
          return FilterChip(
            showCheckmark: false,
            label: Text(entry.value.toString()),
            selected: _value == entry.value,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? entry.value : null;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
