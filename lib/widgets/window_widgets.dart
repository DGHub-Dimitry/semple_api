import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:semper/components/responsive.dart';

class WindowButtons extends StatelessWidget {
  final bool enabledWhite;
  const WindowButtons({this.enabledWhite = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final buttonColors = WindowButtonColors(
        iconNormal: enabledWhite ? Colors.white : Colors.grey,
        mouseOver: const Color(0x00000000),
        mouseDown: const Color(0xFF805306),
        iconMouseOver: const Color(0xFF805306),
        iconMouseDown: const Color(0xFFFFD500));

    final closeButtonColors = WindowButtonColors(
        mouseOver: const Color(0xFFD32F2F),
        mouseDown: const Color(0xFFB71C1C),
        iconNormal: enabledWhite ? Colors.white : Colors.grey,
        iconMouseOver: Colors.white);

    return Responsive.isMobile(context)
        ? const SizedBox()
        : Row(
            children: [
              MinimizeWindowButton(colors: buttonColors),
              MaximizeWindowButton(colors: buttonColors),
              CloseWindowButton(colors: closeButtonColors),
            ],
          );
  }
}

class WindowMover extends StatelessWidget {
  const WindowMover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? const SizedBox()
        : WindowTitleBarBox(child: MoveWindow());
  }
}
