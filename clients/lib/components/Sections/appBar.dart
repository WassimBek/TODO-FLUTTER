import 'package:flutter/material.dart';

AppBar MyAppBar(String title) {
  return AppBar(
    backgroundColor: const Color(0xff3a3b3b),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    elevation: 0.0,
  );
}
