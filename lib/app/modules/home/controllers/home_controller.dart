import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxString now = "".obs;
  PageController pageController = PageController();
  @override
  void onInit() {
    initializeDateFormatting();
    Timer.periodic(3.seconds, (timer) {
      if (pageController.page == 0.0) {
        pageController.animateToPage(1,
            duration: 1000.milliseconds, curve: Curves.easeIn);
      }

      if (pageController.page == 1.0) {
        pageController.animateToPage(0,
            duration: 1000.milliseconds, curve: Curves.easeIn);
      }
    });
    Timer.periodic(1.seconds, (timer) {
      DateTime _temp = DateTime.now();
      now.value = DateFormat("EEEE, dd MMMM yyyy HH:mm:ss", "id").format(_temp);
      now.refresh();
    });
    // Future.delayed(2400.milliseconds, () {
    //   SystemChrome.setEnabledSystemUIMode(
    //     SystemUiMode.edgeToEdge,
    //   );
    // });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
