import 'package:clients/components/Sections/BodyApp.dart';

import '../components/Sections/appBar.dart';
import '../components/Sections/floatingActionButton.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2a2b2b),
      appBar: MyAppBar('TODO APP'),
      body: DefaultPage(),
      floatingActionButton: MyFloatingButton(),
    );
  }
}
