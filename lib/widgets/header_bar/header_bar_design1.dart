import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:semper/components/logo.dart';
import 'package:semper/components/responsive.dart';
import 'package:semper/constants/config.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';
import 'package:semper/widgets/window_widgets.dart';
import 'package:theme_provider/theme_provider.dart';

class HeaderBarDesign1 extends GetView {
  const HeaderBarDesign1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    PageScreenController pageScreenController =
        Get.put(PageScreenController(), permanent: true);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness:
            ThemeProvider.themeOf(context).id.contains('dark')
                ? Brightness.light
                : Brightness.dark,
        statusBarBrightness: ThemeProvider.themeOf(context).id.contains('dark')
            ? Brightness.light
            : Brightness.dark,
        statusBarColor: theme.backgroundColor));

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (Responsive.isMobile(context))
            if (true)
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu, size: 21, color: Colors.grey)),
          if (!Responsive.isMobile(context)) const SizedBox(width: 10),
          if (!Responsive.isMobile(context))
            const SizedBox(
                height: headerLogoSize, child: Logo(size: headerLogoSize)),
          if (Responsive.isMobile(context))
            Obx(() {
              return Text(
                pageScreenController.headerText.value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              );
            }),
          const Expanded(child: WindowMover()),
          Responsive.isMobile(context)
              ? IconButton(
                  onPressed: () {
                    Get.toNamed('/search');
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 21,
                    color: Colors.grey,
                  ),
                )
              : Expanded(
                  flex: 2,
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: theme.cardColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 35,
                        child: TextField(
                          enabled: false,
                          style: TextStyle(
                              fontSize: 12.0, color: theme.primaryColorLight
                              //height: 5,
                              ),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            fillColor: theme.cardColor,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                size: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          if (!Responsive.isMobile(context))
            const Expanded(child: WindowMover()),
          const WindowButtons()
        ],
      ),
    );
  }
}
