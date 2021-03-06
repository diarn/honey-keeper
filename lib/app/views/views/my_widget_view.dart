import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honey_keeper/app/data/my_color.dart';
import 'package:honey_keeper/app/data/my_values.dart';

class MyWidgetView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWidgetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyWidgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class GenerateMyForm extends StatelessWidget {
  final TextEditingController inputController;
  final String label;
  final String hintText;
  final TextInputType inputType;
  final bool isObsecure;
  final String? Function(String?) validator;
  final IconButton? iconButton;
  const GenerateMyForm({
    Key? key,
    required this.inputController,
    required this.label,
    required this.hintText,
    required this.inputType,
    required this.validator,
    required this.isObsecure,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color primaryColor = MyColors.primary.shade900;
    // Color secondaryColor = MyColors.primaryDark.shade900;
    // Color accentColor = Color(0xffffffff);
    // Color errorColor = Color(0xffEF4444);

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextFormField(
        validator: validator,
        controller: inputController,
        obscureText: isObsecure,
        keyboardType: inputType,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          label: Text(label),
          suffixIcon: iconButton,
          labelStyle: TextStyle(color: MyColors.textColor1.shade900),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: MyColors.primary.shade900, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: MyColors.primary.shade700, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: MyColors.errorColor.shade900, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: MyColors.primary.shade900, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final Color labelColor;
  final Color bgColor;
  const MyButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.labelColor,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: size.height * 0.05,
          width: double.infinity,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: labelColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyLoadingButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final Color labelColor;
  final Color bgColor;
  const MyLoadingButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.labelColor,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: size.height * 0.05,
          width: double.infinity,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: labelColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Card01 extends StatelessWidget {
  final String label;
  final String labelValue;
  final String secondValue;
  final double icHeight;
  final double icWidth;
  final IconData iconData;
  final double contentPadding;
  final Function() onTap;
  const Card01({
    Key? key,
    required this.label,
    required this.labelValue,
    required this.secondValue,
    required this.icHeight,
    required this.icWidth,
    required this.iconData,
    required this.contentPadding,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white38,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: icHeight,
                width: icWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black,
                ),
                child: Icon(
                  iconData,
                  size: icHeight * 0.9,
                  color: MyColors.primary.shade900,
                ),
              ),
              SizedBox(
                width: contentPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total $label",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    labelValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          FluentIcons.barcode_scanner_24_regular,
                          size: 36,
                        ),
                        SizedBox(width: MyValues().xWidgetSpace),
                        Text("SCAN"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card02 extends StatelessWidget {
  final String label;
  final String image;
  final double imageSize;
  final String value1;
  final String value2;
  const Card02({
    Key? key,
    required this.label,
    required this.image,
    required this.imageSize,
    required this.value1,
    required this.value2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white30,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              image,
              width: imageSize,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Text(
                  "$value1/$value2",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dialog01 extends StatelessWidget {
  const Dialog01({
    Key? key,
    required this.image,
    required this.label,
    required this.desc,
    required this.funText01,
    required this.funText02,
    required this.fun01,
    required this.fun02,
  }) : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);
  final String image;
  final String label;
  final String desc;
  final String funText01;
  final String funText02;
  final Function() fun01;
  final Function() fun02;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              radius: 25,
              child: Image.asset(image),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                desc,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleBtn1(
                  text: funText01,
                  onPressed: fun01,
                ),
                SimpleBtn1(
                  text: funText02,
                  onPressed: fun02,
                  invertedColors: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  SimpleBtn1(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  // final primaryColor = const Color(0xff4338CA);
  final primaryColor = MyColors.primary;
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
