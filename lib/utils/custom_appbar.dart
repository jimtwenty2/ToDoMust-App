import 'package:flutter/material.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontSize: 30, color: Colors.black),
    ),
    backgroundColor: Colors.yellow,
    elevation: 2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
    ),
  );
}
