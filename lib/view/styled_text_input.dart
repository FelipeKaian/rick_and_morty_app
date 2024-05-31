// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StyledTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const StyledTextInput( {
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusColor: const Color.fromRGBO(88, 221, 0, 1),
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(88, 221, 0, 1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: Color.fromRGBO(88, 221, 0, 1))),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
