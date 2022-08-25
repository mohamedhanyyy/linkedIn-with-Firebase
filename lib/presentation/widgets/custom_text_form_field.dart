import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  Icon prefixIcon;
  String hintText;
  String type;

  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: TextFormField(
        obscureText: type == 'password' ? true : false,
        controller: controller,
        keyboardType: type == 'email'
            ? TextInputType.emailAddress
            : type == 'phone'
                ? TextInputType.phone
                : TextInputType.text,
        validator: (value) {
          if (controller.text.isEmpty) {
            return 'Empty field';
          }
          if (!controller.text.contains('@') && type == 'email') {
            return 'Invalid Email';
          }
          if (controller.text.length < 6 && type == 'password') {
            return 'Invalid Password at least 6 characters';
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
