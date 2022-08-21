import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';
import 'package:semper/controllers/post/post_controller.dart';
import 'package:semper/components/responsive.dart';
import 'package:semper/widgets/empty.dart';
import 'package:semper/widgets/imageview.dart';

class PostList extends GetView<PostController> {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Get.put(PostController());

    PageScreenController pageScreenController = Get.put(PageScreenController());
    return Obx(() {
      if (controller.isLoading.value == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.list.isEmpty) {
        return Empty();
      } else {
        return MasonryGridView.count(
            controller: pageScreenController.scrollController,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            scrollDirection: Axis.vertical,
            itemCount: controller.list.length,
            crossAxisCount: Responsive.isMobile(context) ? 1 : 4,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemBuilder: (context, index) {
              if (index == controller.list.length - 1 &&
                  controller.isMoreDataAvailable.value == true) {
                return Center(child: CircularProgressIndicator());
              }

              return InkWell(
                onTap: () {
                  Get.toNamed('/detail', arguments: controller.list[index]);
                },
                child: Container(
                  color: theme.cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageViewNetwork(
                          url: controller.list[index].photo,
                          width: Responsive.isMobile(context) ? 100 : 130,
                          height: Responsive.isMobile(context) ? 100 : 130,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              controller.list[index].title,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }
    });
  }
}
