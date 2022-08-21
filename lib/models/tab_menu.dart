import 'package:flutter/material.dart';

class TabMenu {
  late String label;
  late IconData selectedIcon;
  late IconData unselectedIcon;
  TabMenu(
      {required this.label,
      required this.selectedIcon,
      required this.unselectedIcon});
}

final List<TabMenu> tabMenuData = [
  TabMenu(
      label: 'Home',
      selectedIcon: Icons.home,
      unselectedIcon: Icons.home_outlined),
  TabMenu(
      label: 'Category',
      selectedIcon: Icons.category,
      unselectedIcon: Icons.category_outlined),
  TabMenu(
      label: 'Favorite',
      selectedIcon: Icons.bookmark,
      unselectedIcon: Icons.bookmark_outline),
  /*TabMenu(
      label: 'Download',
      selectedIcon: Icons.download,
      unselectedIcon: Icons.download_outlined),*/
  TabMenu(
      label: 'Settings',
      selectedIcon: Icons.settings,
      unselectedIcon: Icons.settings_outlined),
];
