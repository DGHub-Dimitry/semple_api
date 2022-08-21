import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHide extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final Duration duration;
  final double height;
  const ScrollToHide(
      {required this.child,
      required this.scrollController,
      this.duration = const Duration(milliseconds: 200),
      this.height = kBottomNavigationBarHeight,
      Key? key})
      : super(key: key);

  @override
  State<ScrollToHide> createState() => _ScrollToHideState();
}

class _ScrollToHideState extends State<ScrollToHide> {
  bool isVisible = true;

  @override
  void initState() {
    widget.scrollController.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() => isVisible = true);
    }
  }

  void hide() {
    if (isVisible) {
      setState(() => isVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: widget.duration,
        height: isVisible ? widget.height : 0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: [
              widget.child,
            ],
          ),
        ),
      );
}
