import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessgae(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
        flushbarPosition: FlushbarPosition.TOP,
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(Icons.error),
      )..show(context),
    );
  }

  static snackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.teal,
        showCloseIcon: true,
        content: Text(message),
      ),
    );
  }
}
