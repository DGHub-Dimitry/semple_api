import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:semper/constants/globals.dart';
import 'package:semper/components/logo.dart';
import 'package:semper/constants/config.dart';
import 'package:semper/controllers/splash/splash_controller.dart';

class SplashScreen extends GetView {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final SplashController splashController = Get.put(SplashController());
    splashController.start(context: context);
    return WillPopScope(
      onWillPop: () => exit(0),
      child: SafeArea(
        child: Scaffold(
          body: SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Logo(size: splashLogoSize),
                      if (splashController.isError.value)
                        const SizedBox(height: 30),
                      if (splashController.isError.value)
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                primary: theme.primaryColor, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                splashController.start(context: context);
                              },
                              child: splashController.isButtonLoading.value
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          color: Colors.white))
                                  : Text('Try again')),
                        ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
