// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';
import 'package:hermes/presentation/widgets/package/package_item.dart';
import 'package:hermes/presentation/widgets/package/travel_list.dart';
import '../values.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Paquete"),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalValue,
          vertical: verticalValue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PackageItem(
              package: PackageModel(
                id: 1,
                name: "Paquete de Aventura",
                idActivity: 1,
                idMunicipality: 1,
                level: 2,
                price: 100,
                reserve: 10,
                description: "Un paquete lleno de aventuras emocionantes.",
                image: "assets/images/package.jpg",
                status: true,
                detailPackagesServices: [],
              ),
            ),
            SizedBox(
              height: 378,
              child: FutureBuilder<List<UserModel>>(
                future: Future.value([UserModel()]),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? TravelList(items: snapshot.data ?? [])
                      : CircularProgressIndicator(
                          color: Colors.blue[colorValue],
                        );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuWidget(currentIndex: 0),
    );
  }
}
