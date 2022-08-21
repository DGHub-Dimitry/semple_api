import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:semper/components/helper.dart';
import 'package:semper/components/responsive.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/models/post.dart';
import 'package:semper/widgets/imageview.dart';
import 'package:semper/widgets/scroll_to_hide.dart';
import 'package:semper/widgets/show_snackbar.dart';
import 'package:semper/widgets/window_widgets.dart';
import 'package:shimmer/shimmer.dart';

class DetailDesign1 extends GetView {
  const DetailDesign1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    final theme = Theme.of(context);
    Post post = Get.arguments;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: theme.cardColor,
      systemNavigationBarIconBrightness:
          isDarkTheme ? Brightness.light : Brightness.dark,
    ));

    return Scaffold(
        backgroundColor: theme.cardColor,
        // extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Expanded(
              child: NestedScrollView(
                  controller: scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Card(
                                    color: theme.primaryColor.withOpacity(0.3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    )),
                              ),
                              const Expanded(child: WindowMover()),
                              const WindowButtons()
                            ]),
                        automaticallyImplyLeading: false,
                        backgroundColor: theme.cardColor,
                        expandedHeight: 400,
                        flexibleSpace: FlexibleSpaceBar(
                          background: ImageViewNetwork(url: post.photo),
                        ),
                        floating: true,
                        // snap: true,
                        pinned: true,
                      )
                    ];
                  },
                  body: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              RatingBar.builder(
                                unratedColor: Colors.grey,
                                ignoreGestures: true,
                                itemSize:
                                    Responsive.isMobile(context) ? 10 : 15,
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                updateOnDrag: false,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                  width: Responsive.isMobile(context) ? 4 : 8),
                              Text(
                                '1k',
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Responsive.isMobile(context)
                              ? const SizedBox(height: 10)
                              : const SizedBox(height: 15),
                          const SizedBox(height: 20),
                          Text(post.body, style: const TextStyle(fontSize: 14)),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  )),
            ),
            ScrollToHide(
              scrollController: scrollController,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: theme.cardColor,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (token == '') {
                            Get.toNamed('/account');
                          } else {
                            Get.toNamed('/comment', arguments: '');
                          }
                        },
                        icon: Icon(Icons.comment_outlined)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark,
                          color: Colors.grey,
                        )),
                    const Expanded(child: SizedBox()),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        primary: theme.primaryColor, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      child: const Text('Continue to reading'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class DetailDesign1Loading extends StatelessWidget {
  const DetailDesign1Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: theme.cardColor,
      systemNavigationBarIconBrightness:
          isDarkTheme ? Brightness.light : Brightness.dark,
    ));

    return SafeArea(
        child: Scaffold(
            // extendBodyBehindAppBar: true,
            body: SafeArea(
                child: Column(
      children: [
        Expanded(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Card(
                                color: theme.primaryColor.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                )),
                          ),
                          const Expanded(child: WindowMover()),
                          const WindowButtons()
                        ]),
                    automaticallyImplyLeading: false,
                    backgroundColor: theme.backgroundColor,
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Shimmer.fromColors(
                        baseColor: theme.cardColor,
                        highlightColor: theme.backgroundColor,
                        child: Container(
                          color: Colors.grey.withOpacity(0.4),
                          width: double.infinity,
                          height: 400,
                        ),
                      ),
                    ),
                    floating: true,
                    // snap: true,
                    pinned: true,
                  )
                ];
              },
              body: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: theme.cardColor,
                        highlightColor: theme.backgroundColor,
                        child: Container(
                          color: Colors.grey.withOpacity(0.4),
                          width: 100,
                          height: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: theme.cardColor,
                            highlightColor: theme.backgroundColor,
                            child: Container(
                              color: Colors.grey.withOpacity(0.4),
                              width: 100,
                              height: 20,
                            ),
                          ),
                          SizedBox(width: Responsive.isMobile(context) ? 4 : 8),
                          Shimmer.fromColors(
                            baseColor: theme.cardColor,
                            highlightColor: theme.backgroundColor,
                            child: Container(
                              color: Colors.grey.withOpacity(0.4),
                              width: 30,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Shimmer.fromColors(
                        baseColor: theme.cardColor,
                        highlightColor: theme.backgroundColor,
                        child: Container(
                          color: Colors.grey.withOpacity(0.4),
                          width: 100,
                          height: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )),
        ),
      ],
    ))));
  }
}
