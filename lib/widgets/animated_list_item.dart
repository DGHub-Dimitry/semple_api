import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/widgets/controllers/animated_list_item_controller.dart';

class AnimatedListItem extends GetWidget {
  final int index;
  final Widget child;
  final Curve curve;

  const AnimatedListItem(
      {required this.index,
      required this.child,
      this.curve = Curves.easeInOutQuart,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimatedListItemController animatedListItemController =
        Get.put(AnimatedListItemController(index: index));
    return Obx(() {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: animatedListItemController.animate.value ? 1 : 0,
        curve: curve,
        child: AnimatedPadding(
            duration: const Duration(milliseconds: 1000),
            padding: animatedListItemController.animate.value
                ? const EdgeInsets.all(0)
                : const EdgeInsets.only(top: 20),
            child: child),
      );
    });
  }
}
