import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/$image',
      fit: BoxFit.cover,
      width: 200,
    );
  }
}
