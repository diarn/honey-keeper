import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  final RxDouble currentPage = 0.0.obs;
  @override
  void onInit() {
    // Future.delayed(1200.milliseconds, () {
    //   SystemChrome.setEnabledSystemUIMode(
    //     SystemUiMode.edgeToEdge,
    //   );
    // });
    pageController.addListener(() {
      currentPage.value = pageController.page!;
      currentPage.refresh();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updatePage(int page) {
    pageController.animateToPage(
      page,
      duration: 500.milliseconds,
      curve: Curves.ease,
    );
    currentPage.value = page.toDouble();
    currentPage.refresh();
  }
}
