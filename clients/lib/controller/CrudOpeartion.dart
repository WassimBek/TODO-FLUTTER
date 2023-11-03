import 'dart:convert';

import 'package:clients/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://[your ip adress]:[port using]";

class GetRequest {
  Future<dynamic> getTask(String path, BuildContext context) async {
    try {
      var url = Uri.parse(baseUrl + path);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return body['data'];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error not getting data'),
        ));
      }
    } catch (e) {
      print('last exception $e');
    }
  }
}

class PostRequest {
  Future<dynamic> addTask(String path, String? title, String? description,
      BuildContext context) async {
    try {
      var body = {
        "title": title,
        "description": description,
      };
      Uri url = Uri.parse(baseUrl + path);
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      var jsonDec = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(jsonDec["data"])));
        Get.offAll(() => const MyHomePage());
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

class PutRequest {
  Future<dynamic> updateData(
      String title, String description, String path, context) async {
    try {
      var body = {
        "title": title,
        "description": description,
      };
      var url = Uri.parse(baseUrl + path);
      var response = await http.put(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      var dataDecode = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(dataDecode.message)));
        Get.offAll(() => const MyHomePage());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(dataDecode.failedUpdate)));
      }
    } catch (e) {
      print("Server Error $e");
    }
  }
}

class DeleteRequest {
  Future<dynamic> deleteTask(String path, context) async {
    try {
      var url = Uri.parse(baseUrl + path);
      var response = await http.delete(url);
      var dataDecode = json.decode(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(dataDecode.message)));
        Get.offAll(() => MyHomePage());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(dataDecode.failedDelete)));
      }
    } catch (e) {
      print("Error Server $e");
    }
  }
}
