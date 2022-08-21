import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';
import 'package:semper/models/tab_menu.dart';
import 'package:theme_provider/theme_provider.dart';

class BottomBarDesign1 extends GetView {
  const BottomBarDesign1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    PageScreenController pageScreenController = Get.put(PageScreenController());
    if (pageScreenController.pageController.hasClients) {
      pageScreenController.onClose();
      pageScreenController.onInit();
    }
    void _onItemTapped(int index) {
      pageScreenController.selectedIndex.value = index;
      if (pageScreenController.pageController.hasClients) {
        pageScreenController.pageController.jumpToPage(index);
      }
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: theme.cardColor,
      systemNavigationBarIconBrightness:
          ThemeProvider.themeOf(context).id.contains('dark')
              ? Brightness.light
              : Brightness.dark,
    ));

    return Obx(() {
      return BottomNavigationBar(
        showSelectedLabels: 1 == 1 ? false : null,
        showUnselectedLabels: 1 == 1 ? false : null,
        backgroundColor: theme.backgroundColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: theme.primaryColor,
        items: tabMenuData
            .map((data) => BottomNavigationBarItem(
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
