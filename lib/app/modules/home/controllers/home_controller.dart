import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    Future.delayed(2400.milliseconds, () {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
      );
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
