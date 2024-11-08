import 'package:flutter/material.dart';

class LikedButtonWidget extends StatefulWidget {
  const LikedButtonWidget({super.key});

  @override
  State<LikedButtonWidget> createState() => _LikedButtonWidgetState();
}

class _LikedButtonWidgetState extends State<LikedButtonWidget> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
      },
      child: Text(
        'Me gusta',
        style: TextStyle(
          color: _isLiked ? Colors.blue : Colors.black45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
