import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:honey_keeper/app/data/my_color.dart';

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
  const GenerateMyForm({
    Key? key,
    required this.inputController,
    required this.label,
    required this.hintText,
    required this.inputType,
    required this.validator,
    required this.isObsecure,
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
  const MyButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: MyColors.primary.shade900,
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
  const MyLoadingButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.grey,
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
