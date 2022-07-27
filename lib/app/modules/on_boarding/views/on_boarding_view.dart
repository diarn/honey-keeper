import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:honey_keeper/app/data/assets_value.dart';
import 'package:honey_keeper/app/data/my_color.dart';
import 'package:honey_keeper/app/data/my_values.dart';
import 'package:honey_keeper/app/routes/app_pages.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  final AssetsValue _assetsValue = AssetsValue();
  final MyValues _myValues = MyValues();

  final AppBar appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: MyColors.primary,
        body: SizedBox(
          height: (size.height) - appBar.preferredSize.height,
          child: Stack(
            children: [
              PageView(
                controller: controller.pageController,
                children: [
                  page(
                    size,
                    _assetsValue.imgSearch,
                    "Cari manual atau scan",
                    "Mencari box atau frame lebih mudah dengan menggunakan fitur scan, jika terjadi hal lain Anda bisa mencarinya dengan manual, gampang kan.",
                  ),
                  page(
                    size,
                    _assetsValue.imgAddTask,
                    "Tambah aktifitas",
                    "Tambahkan aktifitas perawatan, pelaporan, atau penandaan pada box atau frame yang telah dipilih,",
                  ),
                  page(
                    size,
                    _assetsValue.imgSaveLocal,
                    "Simpan secara offline",
                    "Simpan aktifitas pada box tertentu secara offline jika Anda sedang dalam jangkauan yang tidak tercakup oleh sinyal internet",
                  ),
                  page(
                    size,
                    _assetsValue.imgSaveCloud,
                    "Singkronisasi nanti",
                    "Singkronisasikan aktifitas yang telah Anda buat sebelumnya ke cloud atau database jika Anda sudah menjangkau wilayah yang terjangkau oleh sinyal internet",
                  ),
                ],
              ),
              Obx(() {
                return Positioned(
                  bottom: 16,
                  left: 16,
                  child: Row(
                    children: [
                      Material(
                        color: controller.currentPage.value == 0.0
                            ? MyColors.textColor1
                            : Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            controller.updatePage(0);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _myValues.xWidgetSpace,
                      ),
                      Material(
                        color: controller.currentPage.value == 1.0
                            ? MyColors.textColor1
                            : Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            controller.updatePage(1);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _myValues.xWidgetSpace,
                      ),
                      Material(
                        color: controller.currentPage.value == 2.0
                            ? MyColors.textColor1
                            : Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            controller.updatePage(2);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _myValues.xWidgetSpace,
                      ),
                      Material(
                        color: controller.currentPage.value == 3.0
                            ? MyColors.textColor1
                            : Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            controller.updatePage(3);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _myValues.xWidgetSpace,
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Obx(() {
          return FloatingActionButton.extended(
            onPressed: () {
              controller.currentPage != 3.0
                  ? controller.pageController.nextPage(
                      duration: 500.milliseconds,
                      curve: Curves.ease,
                    )
                  : Get.offAllNamed(Routes.LOGIN);
            },
            backgroundColor: MyColors.primaryLight,
            label:
                Text(controller.currentPage != 3.0 ? "Berikutnya" : "Selesai"),
            icon: Icon(
              FluentIcons.arrow_right_24_regular,
            ),
          );
        }),
      ),
    );
  }

  Column page(
    Size size,
    String image,
    String label,
    String desc,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.5,
          child: Center(
            child: Image.asset(
              image,
              width: size.width * 0.75,
            ),
          ),
        ),
        // Expanded(
        //   child: Container(
        //     color: Colors.red,
        //     child: Center(
        //       child: Text("data"),
        //     ),
        //   ),
        // ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: _myValues.yWidgetSpace,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
