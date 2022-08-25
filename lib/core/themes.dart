import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:linkedin/core/colors.dart';

class Themes {
  static ThemeData whiteTheme = ThemeData(
    primarySwatch: AppColors.mainColor,
    fontFamily: 'Robot',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      },
    ),
  );
  static ThemeData blackTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Robot',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      },
    ),
  );
}
