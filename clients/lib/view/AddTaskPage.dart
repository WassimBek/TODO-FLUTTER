import 'package:clients/components/Sections/appBar.dart';
import 'package:clients/components/textField.dart';
import 'package:flutter/material.dart';

class AddingTask extends StatelessWidget {
  const AddingTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2a),
      appBar: MyAppBar('ADD TODO'),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          MyFormField(text: 'title'),
          MyFormField(
            text: 'Description',
            line: 5,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Submit"))
        ],
      ),
    );
  }
}
