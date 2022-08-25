
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dialogues {
  infoDialog({required BuildContext context,
    required String title,
    required String desc,
    required DialogType dialogType,
    Function? callbackFunction}) {
    AwesomeDialog(
        width: ScreenUtil().screenWidth / 1.2,
        context: context,
        animType: AnimType.SCALE,
        autoHide: const Duration(seconds: 3),
        dialogType: dialogType,
        title: title,
        desc: desc,
        onDissmissCallback: (dismissType) {
          if (callbackFunction != null) callbackFunction();
        }).show();
  }

  dynamic customDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required Function onPress,
    required String buttonName,
    required double opacity,
    required Widget content,
    required bool close,
  }) {
    return EasyDialog(
        cardColor: Colors.white,
        fogOpacity: opacity,
        width: ScreenUtil().screenWidth / 1.3,
        height: ScreenUtil().screenHeight / 4,
        cornerRadius: 30.r,
        // contentPadding: EdgeInsets.all(20),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: Colors.blue,
          ),
        ),
        description: Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: Colors.black,
          ),
        ),
        closeButton: close,
        contentList: [
          Align(
            alignment: Alignment.bottomCenter,
            // heightFactor: 2,
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 14.w,
              ),
              color: const Color(0xff44c8f5),
              onPressed: () {
                onPress();
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Text(
                buttonName,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]).show(context);
  }

  confirmDialog({required BuildContext context,
    required String title,
    required String desc,
    required Function onPress,
    required String buttonName,
    required double opacity}) {
    return EasyDialog(
        cardColor: Colors.white,
        fogOpacity: opacity,
        width: ScreenUtil().screenWidth / 1.3,
        height: ScreenUtil().screenHeight / 4,
        cornerRadius: 30.r,
        contentPadding: const EdgeInsets.all(20),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: Colors.blue,
          ),
        ),
        description: Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: Colors.black,
          ),
        ),
        closeButton: true,
        contentList: [
          RaisedButton(
            padding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 14.w,
            ),
            color: const Color(0xff44c8f5),
            onPressed: () {
              onPress();
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
        ]).show(context);
  }

  alertDialog({
    required BuildContext context,
    required String title,
    required String desc,
    required DialogType dialogType,
    required String buttonName,
    required Function onTap,
    bool? dismiss,
  }) {
    AwesomeDialog(
      width: ScreenUtil().screenWidth / 1.2,
      context: context,
      dismissOnBackKeyPress: dismiss ?? true,
      dismissOnTouchOutside: dismiss ?? true,
      animType: AnimType.SCALE,
      // autoHide: Duration(seconds: 5),
      dialogType: dialogType,
      title: title,
      desc: desc,

      btnOk: RaisedButton(
        padding: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 14.w,
        ),
        color: Colors.black,
        onPressed: () {
          onTap();
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
          ),
        ),
      ),
    ).show();
  }

  loading(BuildContext context) {
    AwesomeDialog(
      width: ScreenUtil().screenWidth / 1.2,
      context: context,
      dialogType: DialogType.NO_HEADER,
      autoHide: const Duration(seconds: 1),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    ).show();
  }

  Future<bool> onWillPop(BuildContext context) async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to leave the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: const Text('Yes'),
              ),
            ],
          ),
    );

    return shouldPop ?? false;
  }

  imagePreivewDialog({required BuildContext context,
    required String title,
    required String desc,
    required Function onPress,
    required String buttonName,
    required double opacity,
    required Widget image}) {
    return EasyDialog(
        cardColor: Colors.white,
        fogOpacity: opacity,
        width: ScreenUtil().screenWidth / 1.3,
        height: ScreenUtil().screenHeight / 4,
        cornerRadius: 30.r,
        contentPadding: const EdgeInsets.all(20),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: Colors.blue,
          ),
        ),
        description: Text(
          desc,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: Colors.black,
          ),
        ),
        closeButton: true,
        contentList: [
          Center(child: image),
          RaisedButton(
            padding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 14.w,
            ),
            color: const Color(0xff44c8f5),
            onPressed: () {
              onPress();
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
        ]).show(context);
  }


  showLoadingDialog(BuildContext context) {
    showDialog(
        barrierColor: Colors.black.withOpacity(0.2),
        context: context,
        builder: (context) =>
            CupertinoActivityIndicator(radius: 18.w,)
    );
  }

  hideLoading(BuildContext context){
    Navigator.pop(context);
  }
}
