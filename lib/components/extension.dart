import 'package:flutter/material.dart';

typedef M = Map<String, dynamic>;

extension Extension on BuildContext {
  void nextScreen(String value, Map<dynamic, dynamic> data) async {
    await Navigator.pushNamed(this, value, arguments: data);
  }

  void backScreen(String value) {
    Navigator.pop(this, value);
  }

  Map<dynamic, dynamic> getScreenData() {
    Map<dynamic, dynamic> data = ModalRoute.of(this)!.settings.arguments as Map;
    return data;
  }
}
