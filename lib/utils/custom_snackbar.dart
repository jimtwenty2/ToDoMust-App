import 'package:get/get.dart';
import 'package:flutter/material.dart';

SnackbarController customSnackbar({
  required String title,
  required String msg, // msg : message
  Color color = Colors.green, // default color will be green
}) {
  return Get.snackbar(
    title,
    msg,
    duration: Duration(seconds: 2),
    snackPosition: SnackPosition.TOP,
    colorText: Colors.white,
    backgroundColor: color,
  );
}
