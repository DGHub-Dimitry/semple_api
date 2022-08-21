import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';
import 'package:semper/models/tab_menu.dart';
import 'package:theme_provider/theme_provider.dart';

class BottomBarDesign3 extends GetView {
  const BottomBarDesign3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    PageScreenController pageScreenController = Get.put(PageScreenController());

    void _onItemTapped(int index) {
      pageScreenController.selectedIndex.value = index;

      if (pageScreenController.pageController.hasClients) {
        pageScreenController.pageController.jumpToPage(index);
      }
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: theme.backgroundColor,
      systemNavigationBarIconBrightness:
          ThemeProvider.themeOf(context).id.contains('dark')
              ? Brightness.light
              : Brightness.dark,
    ));

    return Obx(() {
      return BottomNavigationBar(
        showSelectedLabels: 1 == 1 ? false : null,
        showUnselectedLabels: 1 == 1 ? false : null,
        backgroundColor: theme.primaryColor,
        unselectedItemColor: theme.backgroundColor,
        selectedItemColor: theme.backgroundColor,
        items: tabMenuData
            .map((data) => BottomNavigationBarItem(
                backgroundColor: theme.primaryColor,
                label: data.label,
                icon: Icon(data.unselectedIcon),
                activeIcon: Icon(data.selectedIcon)))
            .toList(),
        currentIndex: pageScreenController.selectedIndex.value,
        onTap: _onItemTapped,
      );
    });
  }
}
