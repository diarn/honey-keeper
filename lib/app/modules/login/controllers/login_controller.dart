import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honey_keeper/app/controllers/my_box_controller.dart';
import 'package:honey_keeper/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final MyBoxController _myBoxController = Get.put(MyBoxController());
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameOrEmail = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool isLogginIn = false.obs;
  final RxBool showPassword = false.obs;

  @override
  void onInit() {
    // Future.delayed(1200.milliseconds, () {
    //   SystemChrome.setEnabledSystemUIMode(
    //     SystemUiMode.edgeToEdge,
    //   );
    // });
    // inspect(_userController.token.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String? Function(String?) validator(String type) {
    late String? Function(String?) result;
    switch (type) {
      case "Username Or Email":
        result = (v) {
          if (v == null || v.isEmpty) {
            return "Harap isi username atau email Anda";
          }

          if (v.contains("@") && v.isEmail == false) {
            return "Harap masukkan format email yang benar";
          }
          return null;
        };
        break;
      case "Password":
        result = (v) {
          if (v == null || v.isEmpty) {
            return "Harap isi kata sandi Anda";
          }

          if (v.length < 8) {
            return "Password harus 8 karakter";
          }
          return null;
        };
        break;
      default:
    }

    return result;
  }

  login() {
    isLogginIn.value = true;
    isLogginIn.refresh();
    Future.delayed(2000.milliseconds, () {
      _myBoxController.writeToken("token data value");
    }).then((value) {
      Get.offNamed(Routes.HOME);
    });
  }
}
