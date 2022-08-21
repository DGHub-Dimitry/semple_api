import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isError = false.obs;
  var isButtonLoading = false.obs;

  start({required BuildContext context}) {
    if (Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    }
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed('/page');
    });
  }
}
