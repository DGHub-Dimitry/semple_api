import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/responsive.dart';

class PostHeader extends GetView {
  const PostHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!Responsive.isMobile(context))
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Post',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
