import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:honey_keeper/app/data/my_color.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: "qr");
  final AppBar appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(),
      child: Scaffold(
        backgroundColor: MyColors.primary,
        body: Container(
          height: size.height,
          child: Stack(
            children: [
              QRView(
                key: _qrKey,
                onQRViewCreated: controller.onQRViewCreate,
              ),
              Obx(() {
                return controller.isTapped.value == false
                    ? Center(
                        child: GestureDetector(
                          onTap: () {
                            controller.qrViewController!.resumeCamera();
                            controller.isTapped.value = true;
                            controller.isTapped.refresh();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: MyColors.primary,
                            ),
                            child: Text(
                              "Ketuk Layar Untuk Mulai Memindai",
                              style: TextStyle(
                                color: MyColors.textColor1,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox();
              }),
              Container(
                height: size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: appBar.preferredSize.height,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: MyColors.primary,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  FluentIcons.arrow_left_24_regular,
                                ),
                                color: MyColors.textColor1,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: MyColors.primary,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  controller.qrViewController!.toggleFlash();
                                },
                                icon: Icon(
                                  FluentIcons.flash_24_regular,
                                ),
                                color: MyColors.textColor1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 76,
                left: 16,
                child: Obx(() {
                  if (controller.scanSource.value != "" &&
                      controller.scanValue.value != "") {
                    return Container(
                      padding: EdgeInsets.all(16),
                      width: (size.width) - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.primary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Material(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.primaryLight,
                            child: InkWell(
                              onTap: () {
                                controller.qrViewController!.resumeCamera();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text("Pindai Ulang"),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(controller.scanSource.value),
                              Text(controller.scanValue.value),
                            ],
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.primaryLight,
                            child: InkWell(
                              onTap: () {
                                // controller.qrViewController!.resumeCamera();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text("Lanjutkan"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
