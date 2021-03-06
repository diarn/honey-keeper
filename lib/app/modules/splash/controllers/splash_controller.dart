import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:honey_keeper/app/controllers/user_controller.dart';
import 'package:honey_keeper/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final _userController = Get.put(UserController());
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
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.edgeToEdge,
        );
        _userController.token.value != ""
            ? Get.offNamed(Routes.HOME)
            : Get.offNamed(Routes.ON_BOARDING);
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
