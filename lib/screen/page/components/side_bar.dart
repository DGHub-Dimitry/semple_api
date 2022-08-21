import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';

class SideBar extends GetView {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    PageScreenController pageScreenController = Get.put(PageScreenController());

    return Obx(() {
      return SizedBox(
        width: 70,
        child: NavigationRail(
            selectedLabelTextStyle:
                TextStyle(fontSize: 10, color: theme.primaryColor),
            //useIndicator: true,
            //indicatorColor: theme.cardColor.withOpacity(0.5),
            backgroundColor: theme.backgroundColor,
            selectedIconTheme: IconThemeData(color: theme.primaryColor),
            selectedIndex: pageScreenController.selectedIndex.value,
            labelType: NavigationRailLabelType.selected,
            destinations: pageScreenController.tabMenu
                .map((data) => NavigationRailDestination(
                    icon: Card(
                        color: const Color(0x00000000),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(data.unselectedIcon, color: Colors.grey)),
                    label: Text(
                      data.label,
                    ),
                    selectedIcon: Card(
                        color: theme.cardColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(data.selectedIcon),
                        ))))
                .toList(),
            onDestinationSelected: (index) {
              pageScreenController.selectedIndex.value = index;
              if (pageScreenController.pageController.hasClients) {
                pageScreenController.pageController.jumpToPage(index);
              }
            }),
      );
    });
  }
}
