import 'package:flutter/material.dart';

class AppNavigator {
  static void navigate(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigateReplacement(
      {required BuildContext context, required String routeName}) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
