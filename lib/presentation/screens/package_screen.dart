import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';

import '../values.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Paquete",
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue,
          vertical: verticalValue,
        ),
        child: const Text('Package Screen'),
      ),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 0,
      ),
    );
  }
}
