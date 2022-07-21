import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:honey_keeper/app/controllers/user_controller.dart';
import 'package:honey_keeper/app/routes/app_pages.dart';

class SplashController extends GetxController {
  var _userController = Get.put(UserController());
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
        _userController.token.value != ""
            ? Get.offNamed(Routes.HOME)
            : Get.offNamed(Routes.LOGIN);

        // if (_userController.token.value != "") {
        // } else {
        // }
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
