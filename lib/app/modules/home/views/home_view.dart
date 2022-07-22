import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:honey_keeper/app/data/assets_value.dart';
import 'package:honey_keeper/app/data/my_color.dart';
import 'package:honey_keeper/app/data/my_values.dart';
import 'package:honey_keeper/app/views/views/my_widget_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AppBar appBar = AppBar();
  final AssetsValue _assetsValue = AssetsValue();
  final MyValues _myValues = MyValues();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    controller.onInit();
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
        backgroundColor: MyColors.primary.shade900,
        extendBody: true,
        body: Column(
          children: [
            SizedBox(
              height: appBar.preferredSize.height,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.1,
                    height: size.width * 0.1,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      child: Image.asset(
                        _assetsValue.imgDefaultAvatar,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyValues().xWidgetSpace,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang",
                        style: TextStyle(
                          color: MyColors.textColor1.shade900,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Diar Nurrizky",
                        style: TextStyle(
                          color: MyColors.textColor1.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Icon(
                    FluentIcons.alert_24_filled,
                    color: MyColors.textColor1.shade900,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: _myValues.yWidgetSpace,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Card01(
                        label: "Box",
                        labelValue: "50",
                        secondValue: "20",
                        icHeight: size.height * 0.07,
                        icWidth: size.height * 0.07,
                        iconData: FluentIcons.mail_inbox_all_24_regular,
                        contentPadding: _myValues.xWidgetSpace,
                        onTap: () {
                          Get.showSnackbar(
                            GetSnackBar(
                              title: "Klik Box",
                              message: "Anda telah klik box",
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: _myValues.yWidgetSpace,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Card01(
                        label: "Frame",
                        labelValue: "200",
                        secondValue: "139",
                        icHeight: size.height * 0.07,
                        icWidth: size.height * 0.07,
                        iconData: FluentIcons.textbox_24_regular,
                        contentPadding: _myValues.xWidgetSpace,
                        onTap: () {
                          Get.showSnackbar(
                            GetSnackBar(
                              title: "Klik Frame",
                              message: "Anda telah klik frame",
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.111,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Search",
                  icon: FluentIcons.search_24_regular,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Box",
                  icon: FluentIcons.mail_inbox_24_regular,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Frame",
                  icon: FluentIcons.textbox_24_regular,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Account",
                  icon: FluentIcons.home_person_24_regular,
                  selected: false,
                  onPressed: () {}),
              const Spacer(),
              IconBottomBar2(
                  text: "Home",
                  icon: FluentIcons.add_square_24_filled,
                  selected: true,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = MyColors.primaryDark.shade900;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primaryColor : Colors.black87,
          ),
        ),
      ],
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  IconBottomBar2(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final primaryColor = MyColors.primary.shade900;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColor,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          // size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
