import 'package:get/get.dart';
import 'package:semper/controllers/page/page_screen_controller.dart';
import 'package:semper/controllers/post/post_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<PageScreenController>(() => PageScreenController());
  }
}
