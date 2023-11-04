import 'package:clients/view/AddTaskPage.dart';
import 'package:clients/view/updateTask.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO-DO',
      initialRoute: "/Home",
      getPages: [
        GetPage(name: "/Home", page: () => MyHomePage()),
        GetPage(name: "/Add", page: () => AddingTask()) ,
        GetPage(name: "/update", page: () => MyUpdatePage())
      ],
    );
  }
}
