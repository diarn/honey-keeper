import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:honey_keeper/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  setLayout() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    ).then((value) {
      Future.delayed(1200.milliseconds, () {
        Get.offNamed(Routes.HOME);
        // SystemChrome.setEnabledSystemUIMode(
        //   SystemUiMode.edgeToEdge,
        // );
      });
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
