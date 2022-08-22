import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void showErrorDialog(
      {required String msg, required BuildContext context, Color? color}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(msg),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ok'))
        ],
      ),
    );
  }

  //TODO check up the result of this
  static void showToast({required String msg, Color color = Colors.red}) async {
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

// static double? screenWidth;
}
