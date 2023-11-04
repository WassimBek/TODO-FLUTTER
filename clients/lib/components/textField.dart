import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  MyFormField({
    super.key,
    required this.text,
    this.line = 1,
    required this.onChange,
    this.value,
  });
  final String text;
  final int? line;
  final Function(String?) onChange;
  String? value;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: line,
      style: const TextStyle(color: Colors.white),
      onChanged: onChange,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 179, 179, 179),
            style: BorderStyle.solid,
          )),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
            width: 3,
            style: BorderStyle.solid,
          )),
          hintText: text,
          hintStyle: const TextStyle(color: Color.fromARGB(167, 184, 184, 184)),
          labelStyle: const TextStyle(color: Colors.white)),
          initialValue: value,
    );
  }
}
