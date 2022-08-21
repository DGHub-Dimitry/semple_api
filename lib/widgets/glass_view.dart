import 'dart:ui';

import 'package:flutter/material.dart';

class GlassView extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final double radius;
  final double spreadRadius;
  final colorBg;
  final color;
  final double border;
  final opacity;

  const GlassView(
      {Key? key,
      this.width,
      this.height,
      required this.child,
      this.radius = 0.0,
      this.spreadRadius = 0.0,
      required this.colorBg,
      required this.color,
      this.border = 0.0,
      this.opacity = 0.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              blurRadius: radius,
              spreadRadius: spreadRadius,
              color: colorBg.withOpacity(opacity),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spreadRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 40.0,
            sigmaY: 40.0,
          ),
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: color.withOpacity(opacity),
                  borderRadius: BorderRadius.circular(spreadRadius),
                  border: Border.all(
                    width: border,
                    color: color.withOpacity(opacity),
                  )),
              child: child),
        ),
      ),
    );
  }
}
