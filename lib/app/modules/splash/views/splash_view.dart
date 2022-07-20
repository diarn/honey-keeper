import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:honey_keeper/app/data/my_color.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.setLayout();
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: MyColors.primary.shade900,
        body: Stack(
          children: [
            Positioned(
              top: -25,
              right: -75,
              child: Image.asset(
                "assets/images/bg_splash.png",
                scale: 0.9,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/app_logo.png",
                width: size.width * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
