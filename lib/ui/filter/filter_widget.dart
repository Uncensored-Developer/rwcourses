import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.text})
      : super(key: key);

  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(value: value, groupValue: groupValue, onChanged: onChanged),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
