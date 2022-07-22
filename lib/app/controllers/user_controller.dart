import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:honey_keeper/app/controllers/my_box_controller.dart';

class UserController extends GetxController {
  final MyBoxController _myBoxController = Get.put(MyBoxController());
  final box = GetStorage();
  final RxString token = "".obs;
  @override
  void onInit() async {
    if (box.read("token") != null) {
      token.value = _myBoxController.readToken();
      token.refresh();
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
