import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO-DO',
      home: MyHomePage(),
    );
  }
}
