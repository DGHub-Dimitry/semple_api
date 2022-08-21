import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  final String label;
  const CustomCheckBox(
      {required this.onChanged,
      required this.label,
      required this.value,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Checkbox(value: value, onChanged: onChanged), Text(label)],
    );
  }
}
