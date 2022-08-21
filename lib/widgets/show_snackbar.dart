import 'package:flutter/material.dart';

showSnackBar(
    {required BuildContext context,
    required String title,
    required IconData icon}) {
  final theme = Theme.of(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 0,
    margin: const EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    backgroundColor: theme.cardColor,
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 20,
        ),
        SizedBox(width: 8),
        Text(title, style: TextStyle(color: Colors.grey)),
      ],
    ),
    // the duration of your snack-bar
    duration: Duration(milliseconds: 1500),
  ));
}
