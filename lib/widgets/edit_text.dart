import 'package:flutter/material.dart';
import 'package:semper/constants/globals.dart';

class EditText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final IconData? icon_left;
  final int line;
  final int? max_lenght;
  final TextInputType keyboardType;
  const EditText(
      {this.line = 1,
      this.max_lenght,
      this.keyboardType = TextInputType.multiline,
      required this.controller,
      required this.hint,
      required this.label,
      required this.icon,
      this.icon_left,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      maxLength: max_lenght,
      keyboardType: keyboardType,
      maxLines: line,
      controller: controller,
      style: TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
      // obscureText: true,
      decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.red[400],
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isDarkTheme ? Colors.grey.shade800 : Colors.grey,
                width: 1.5),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isDarkTheme ? Colors.grey.shade800 : Colors.grey)),
          prefixIcon: icon_left == null
              ? null
              : Icon(icon_left, color: Colors.grey, size: 17),
          suffixIcon:
              icon == null ? null : Icon(icon, color: Colors.grey, size: 17),
          labelText: label,
          floatingLabelStyle: TextStyle(color: theme.primaryColor),
          labelStyle: TextStyle(color: Colors.grey),
          hintStyle: const TextStyle(fontSize: 12.0, color: Colors.grey),
          hintText: hint),
    );
  }
}
