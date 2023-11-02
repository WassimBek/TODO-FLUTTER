import 'dart:convert';
import 'dart:io';

import 'package:clients/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FetchingData extends GetxController {
  String baseUrl = "http://[your ip adress]:[port u use]";

  Future<dynamic>? getTask(String path, BuildContext context) async {
    try {
      var url = Uri.parse(baseUrl + path);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return body['data'];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error not getting data'),
        ));
      }
    } catch (e) {
      print('last exception $e');
    }
  }

  Future<dynamic>? addTask(String path, String? title, String? description,
      BuildContext context) async {
    try {
      var body = {
        "title": title,
        "description": description,
      };
      var url = Uri.parse(baseUrl + path);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      var jsonDec = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(jsonDec["data"])));
        Get.to(() => MyHomePage());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(jsonDec["message"]),
        ));
      }
    } catch (e) {
      print("Error of sending $e");
    }
  }
}
