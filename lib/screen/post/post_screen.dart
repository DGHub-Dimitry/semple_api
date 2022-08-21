import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semper/screen/post/components/post_header.dart';
import 'package:semper/screen/post/components/post_list.dart';

class PostScreen extends GetView {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PostHeader(),
          Expanded(
            child: PostList(),
          ),
        ]);
  }
}
