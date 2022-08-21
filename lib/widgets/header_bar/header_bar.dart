import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/widgets/header_bar/header_bar_design1.dart';
import 'package:semper/widgets/header_bar/header_bar_design2.dart';

class HeaderBar extends GetView {
  const HeaderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (2) {
      case 1:
        return const HeaderBarDesign1();
      case 2:
        return const HeaderBarDesign2();
      case 3:
        return const HeaderBarDesign1();
      default:
        return const HeaderBarDesign1();
    }
  }
}
