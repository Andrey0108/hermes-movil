import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key, required this.hintText, required this.dataText});

  final String hintText;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    String fontFamily = "greycliffcf";
    double hintTextSize = 16;
    double labelTextSize = 14;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: labelTextSize,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dataText,
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: hintTextSize,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
