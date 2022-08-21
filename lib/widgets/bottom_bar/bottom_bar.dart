import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/widgets/bottom_bar/bottom_bar_design1.dart';
import 'package:semper/widgets/bottom_bar/bottom_bar_design2.dart';
import 'package:semper/widgets/bottom_bar/bottom_bar_design3.dart';

class BottomBar extends GetView {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (1) {
      case 1:
        return const BottomBarDesign1();
      case 2:
        return const BottomBarDesign2();
      case 3:
        return const BottomBarDesign3();
      default:
        return const BottomBarDesign1();
    }
  }
}
