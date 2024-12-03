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
            FutureBuilder<List<Travel>>(
              future: Future.value([
                Travel(1, "Felipe", "333255", true),
                Travel(2, "Juan", "333255", false),
                Travel(3, "Pedro", "333255", true),
                Travel(4, "Pablo", "333255", false),
                Travel(5, "asd", "333255", false),
                Travel(6, "fsd", "333255", false),
                Travel(7, "sdf", "333255", false),
                Travel(8, "sff", "333255", false),
                Travel(8, "asdasf", "333255", false),
              ]),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? TravelList(
                        items: snapshot.data ?? [],
                      )
                    : CircularProgressIndicator(
                        color: Colors.blue[colorValue],
                      );
              },
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
