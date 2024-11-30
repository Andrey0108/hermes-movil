import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';
import 'package:hermes/presentation/widgets/package/card_widget.dart';
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
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue,
          vertical: verticalValue,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🧳 MAMM'),
            Text("📆 Lunes, 25 de noviembre de 2024 | 06:00 - 08:00"),
            Text("🧩 Incluye: Transporte, Desayuno"),
            Text("👤 Viajeros: 1"),
            CardWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 0,
      ),
    );
  }
}
