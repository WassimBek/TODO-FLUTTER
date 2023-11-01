import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  const MyFormField({super.key, required this.text, this.line});
  final String text;
  final int? line;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: line,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 2,
            color: const Color.fromARGB(255, 179, 179, 179),
            style: BorderStyle.solid,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 3,
            style: BorderStyle.solid,
          )),
          hintText: text,
          hintStyle: TextStyle(color: Color.fromARGB(167, 184, 184, 184)),
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
