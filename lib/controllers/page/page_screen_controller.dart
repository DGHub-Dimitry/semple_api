import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/models/tab_menu.dart';
import 'package:semper/screen/post/post_screen.dart';

class PageScreenController extends GetxController {
  List<Widget> pageScreenData = [
    const PostScreen(),
    const PostScreen(),
    const PostScreen(),
    const PostScreen(),
  ].obs;

  late PageController pageController;
  late ScrollController scrollController;

  var currentPage = 0.obs;
  var headerText = tabMenuData[0].label.obs;
  var selectedIndex = 0.obs;
  List<TabMenu> tabMenu = tabMenuData.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    headerText.value = 'Home';
    pageController = PageController(
      initialPage: selectedIndex.value,
      keepPage: true,
    );
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
