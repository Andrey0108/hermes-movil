import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  const FieldWidget(
      {super.key, required this.hintText, required this.oscureText});

  final String hintText;
  final bool oscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: oscureText,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
