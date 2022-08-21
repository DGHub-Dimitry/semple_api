import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/components/responsive.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';
import 'package:semper/screen/page/components/drawer_menu.dart';
import 'package:semper/screen/page/components/side_bar.dart';
import 'package:semper/widgets/bottom_bar/bottom_bar.dart';
import 'package:semper/widgets/header_bar/header_bar.dart';
import 'package:semper/widgets/scroll_to_hide.dart';

class PageScreen extends GetView {
  const PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageScreenController pageScreenController = Get.put(PageScreenController());

    return WillPopScope(
        onWillPop: () => exit(0),
        child: SafeArea(
          child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(60), child: HeaderBar()),
            drawer: const DrawerMenu(),
            body: SafeArea(
              child: Stack(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isMobile(context)) const SideBar(),
                      Expanded(
                          child: PageView.builder(
                        // padEnds: true,
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageScreenController.pageController,
                        pageSnapping: true,
                        onPageChanged: (int page) {
                          if (page == 0) {
                            pageScreenController.headerText.value = 'Home';
                          } else {
                            pageScreenController.headerText.value =
                                pageScreenController.tabMenu[page].label;
                          }
                        },
                        //shrinkWrap: true,
                        scrollDirection: Responsive.isMobile(context)
                            ? Axis.horizontal
                            : Axis.vertical,
                        itemCount: pageScreenController.pageScreenData.length,
                        itemBuilder: (context, index) {
                          return pageScreenController.pageScreenData[index];
                        },
                      ))
                    ],
                  ),
                  if (Responsive.isMobile(context))
                    if (1 == 1)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ScrollToHide(
                            height: 80,
                            scrollController:
                                pageScreenController.scrollController,
                            child: Container(
                              margin: 0 == 1
                                  ? const EdgeInsets.fromLTRB(30, 0, 30, 20)
                                  : null,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0)),
                                child: const BottomBar(),
                              ),
                            )),
                      )
                ],
              ),
            ),
            extendBody: true,
            extendBodyBehindAppBar: true,
          ),
        ));
  }
}
