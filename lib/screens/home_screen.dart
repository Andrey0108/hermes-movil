import 'package:flutter/material.dart';
import 'package:hermes/widgets/listview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.black45,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: const ListviewWidget(),
      backgroundColor: Colors.grey[100],
    );
  }
}
