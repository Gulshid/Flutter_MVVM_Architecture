import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utills {
  static void fieldfocusNode(
    BuildContext context,
    FocusNode cuurent,
    FocusNode next,
  ) {
    cuurent.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.deepPurple,
      textColor: Colors.white,
      fontSize: 20.sp,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  static void flushBarErrorMessages(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        // titleText: Center(child: Text('Hello')),
        forwardAnimationCurve: Curves.decelerate,
        backgroundColor: Colors.deepPurple,
        textDirection: TextDirection.ltr,
        duration: Duration(seconds: 2),
        messageColor: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        reverseAnimationCurve: Curves.easeOut,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        icon: Icon(Icons.error, size: 20.sp, color: Colors.white),
      )..show(context),
    );
  }

  static snakbar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(message),
        padding: EdgeInsets.all(20),

        //  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      ),
    );
  }
}
