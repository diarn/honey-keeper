import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxString now = "".obs;
  @override
  void onInit() {
    initializeDateFormatting();
    Timer.periodic(1.seconds, (timer) {
      DateTime _temp = DateTime.now();
      now.value = DateFormat("EEEE, dd MMMM yyyy HH:mm:ss", "id").format(_temp);
      now.refresh();
    });
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
