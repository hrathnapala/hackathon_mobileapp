import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

void successMsg(context, String msg, int displayTime) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    // leftBarIndicatorColor: Colors.white,
    // title: "Success",
    icon: Icon(
      Icons.check_circle,
      color: Colors.white,
    ),
    message: msg,
    duration: Duration(seconds: displayTime),
    backgroundColor: Colors.green,
  )..show(context);
}

void errorMsg(context, String msg, int displayTime) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    // leftBarIndicatorColor: Colors.white,s
    // title: "Error",
    icon: Icon(
      Icons.error_outline,
      color: Colors.white,
    ),
    message: msg,
    duration: Duration(seconds: displayTime),
    // backgroundColor: Color(0xffA240A4),
    backgroundColor: Colors.red,
  )..show(context);
}

void infoMsg(context, String title, String msg, int displayTime) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.GROUNDED,
    title: title,
    icon: Icon(
      Icons.info,
      color: Colors.white,
    ),
    message: msg,
    duration: Duration(seconds: displayTime),
  )..show(context);
}
