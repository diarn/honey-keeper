import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyBoxController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  writeToken(String value) {
    box.write("token", value);
  }

  String readToken() {
    return box.read("token");
  }
}
