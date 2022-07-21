import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:honey_keeper/app/data/my_color.dart';
import 'package:honey_keeper/app/data/my_values.dart';
import 'package:honey_keeper/app/views/views/my_widget_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
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
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: LoginForm(
                      controller: controller,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final controller;
  const LoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final MyValues _myValues = MyValues();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          GenerateMyForm(
            inputController: widget.controller.userNameOrEmail,
            label: "Username atau Email",
            hintText: "diarn@mail.com",
            inputType: TextInputType.emailAddress,
            validator: widget.controller.validator("Username Or Email"),
            isObsecure: false,
          ),
          SizedBox(height: _myValues.yWidgetSpace),
          GenerateMyForm(
            inputController: widget.controller.password,
            label: "Kata Sandi",
            hintText: "Masukkan kata sandi Anda",
            inputType: TextInputType.text,
            validator: widget.controller.validator("Password"),
            isObsecure: true,
          ),
          SizedBox(height: _myValues.yContentSpace),
          Obx(
            () {
              return widget.controller.isLogginIn.value != true
                  ? MyButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          widget.controller.login();
                        }
                      },
                      label: "MASUK",
                      labelColor: MyColors.textColor1.shade900,
                    )
                  : MyLoadingButton(
                      onTap: () {},
                      label: "SEDANG LOADING",
                      labelColor: Colors.white,
                    );
            },
          ),
        ],
      ),
    );
  }
}
