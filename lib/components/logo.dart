import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class Logo extends StatefulWidget {
  final bool enableFilter;
  const Logo({this.enableFilter = false, Key? key, required this.size})
      : super(key: key);

  final double size;

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    //..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: _animation,
      child: ColorFiltered(
          colorFilter: widget.enableFilter
              ? ColorFilter.mode(theme.backgroundColor, BlendMode.srcATop)
              : ColorFilter.mode(theme.primaryColor, BlendMode.modulate),
          child: Image.asset(
            ThemeProvider.themeOf(context).id.contains('dark')
                ? 'assets/images/logo_for_dark.png'
                : 'assets/images/logo.png',
            height: widget.size,
          )),
    );
  }
}
