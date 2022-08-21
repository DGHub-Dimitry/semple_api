import 'package:get/get.dart';

class AnimatedListItemController extends GetxController {
  final int index;
  AnimatedListItemController({required this.index});
  RxBool animate = false.obs;
  RxBool isStart = true.obs;

  @override
  void onInit() {
    isStart.value
        ? Future.delayed(Duration(milliseconds: index * 100), () {
            animate.value = true;
            isStart.value = false;
          })
        : animate.value = true;
    super.onInit();
  }
}
