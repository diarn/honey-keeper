import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:honey_keeper/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
    Future.delayed(1200.milliseconds, () {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
      ).then((value) {
        Get.toNamed(Routes.HOME);
        Get.delete<SplashController>();
      });
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
