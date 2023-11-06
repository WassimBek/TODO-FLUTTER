import 'package:clients/components/Sections/appBar.dart';
import 'package:clients/controller/CrudOpeartion.dart';
import 'package:flutter/material.dart';

import '../components/textField.dart';

class MyUpdatePage extends StatelessWidget {
  MyUpdatePage({super.key, this.prevTitle, this.prevDescription, this.id});
  String? prevTitle;
  String? prevDescription;
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2a),
      appBar: myAppBar("UPDATE TASK"),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          MyFormField(
            value: prevTitle,
            text: 'title',
            onChange: (title) {
              prevTitle = title!;
            },
          ),
          MyFormField(
              value: prevDescription,
              text: 'Description',
              line: 5,
              onChange: (description) {
                prevDescription = description!;
              }),
          ElevatedButton(
              onPressed: () {
                PutRequest().updateData("/update/task/" + id.toString(),
                    prevTitle!, prevDescription!, context);
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}
