// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hermes/data/models/package/package_model.dart';
import 'package:hermes/data/models/travel/travel_model.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';
import 'package:hermes/presentation/widgets/package/travel_list.dart';
import '../values.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key, required this.package});

  final Package package;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📝 Nombre: ${package.nombre}"),
            Text("📅 Fecha: ${package.fecha}"),
            Text("🛏️ Servicios: ${package.servicios.length}"),
            Text("👤 Viajeros: ${package.viajeros}"),
            Center(
              child: FutureBuilder<List<Travel>>(
                future: Future.value([
                  Travel(1, "Felipe", "333255", true),
                  Travel(2, "Juan", "333255", true)
                ]),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? TravelList(items: snapshot.data ?? [])
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 0,
      ),
    );
  }
}
