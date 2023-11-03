import 'package:clients/components/Sections/appBar.dart';
import 'package:clients/components/textField.dart';
import 'package:clients/controller/CrudOpeartion.dart';
import 'package:flutter/material.dart';

class AddingTask extends StatelessWidget {
  AddingTask({super.key});
  String? titleData = '';
  String? descriptionData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2a),
      appBar: myAppBar('ADD TODO'),
      body: ListView(
        padding:const EdgeInsets.all(20),
        children: [
          MyFormField(
            text: 'title',
            onChange: (title) {
              titleData = title;
            },
          ),
          MyFormField(
              text: 'Description',
              line: 5,
              onChange: (description) {
                descriptionData = description;
              }),
          ElevatedButton(
              onPressed: () {
                PostRequest()
                    .addTask("/add/task", titleData, descriptionData, context);
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
