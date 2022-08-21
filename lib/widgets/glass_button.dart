
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final color;
  final double border;
  final opacity;
  final text;
  final textColor;
  final double textSize;
  final textWeight;
  final onClick;
  final padding;

  const GlassButton(
      {Key? key,
      this.width = double.infinity,
      this.height = double.infinity,
      this.radius = 0.0,
      this.color = Colors.white,
      required this.onClick,
      this.border = 0.0,
      this.opacity = 0.3,
      this.text = 'Button',
      this.textColor = Colors.white,
      this.textSize = 12,
      this.textWeight = FontWeight.normal,
      this.padding = const EdgeInsets.all(8.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: padding,
            primary: Colors.grey.shade400.withOpacity(opacity), // background
            onPrimary: color, // foreground
          ),
          onPressed: onClick,
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: textWeight)),
        ),
      ),
    );
  }
}
