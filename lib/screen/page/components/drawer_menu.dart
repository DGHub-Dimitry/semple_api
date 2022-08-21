import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/components/logo.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';

class DrawerMenu extends GetView {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    PageScreenController pageScreenController = Get.put(PageScreenController());
    void _onItemTapped(int index) {
      pageScreenController.selectedIndex.value = index;
      if (pageScreenController.pageController.hasClients) {
        pageScreenController.pageController.jumpToPage(index);
      }

      Get.back();
    }

    return Container(
      width: 280,
      height: double.infinity,
      color: theme.cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Logo(size: 50)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: pageScreenController.tabMenu.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      _onItemTapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              pageScreenController.selectedIndex.value == index
                                  ? theme.primaryColor
                                  : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Icon(
                              pageScreenController
                                  .tabMenu[index].unselectedIcon,
                              size: 25,
                              color: pageScreenController.selectedIndex.value ==
                                      index
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                pageScreenController.tabMenu[index].label,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: pageScreenController
                                                .selectedIndex.value ==
                                            index
                                        ? Colors.white
                                        : Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Developed by DGHub',
                  style: TextStyle(fontSize: 10, color: theme.primaryColor),
                )),
          )
        ],
      ),
    );
  }
}
