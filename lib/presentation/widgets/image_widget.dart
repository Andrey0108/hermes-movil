import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.image, this.width = 150.0});

  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/img/$image', fit: BoxFit.contain, width: width);
  }
}
