import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key, required this.hintText, required this.oscureText});

  final String hintText;
  final Bool oscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            oscureText: false
            hintText: hintText
        )
    )
  }
}
