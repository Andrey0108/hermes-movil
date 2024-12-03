// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hermes/data/models/package/package_model.dart';
import 'package:hermes/data/models/travel/travel_model.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';
import 'package:hermes/presentation/widgets/package/package_item.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PackageItem(package: package),
              SizedBox(
                height: 378,
                child: FutureBuilder<List<Travel>>(
                  future: Future.value([
                    Travel(1, "Juan Felipe Quintero Gutierrez", "3128283889",
                        true),
                    Travel(2, "Alan Andrey Sanchez Caro", "3011111101", false),
                    Travel(
                        3, "Brayan Leandro Sanchez Caro", "3052863004", false),
                    Travel(
                        3, "Juan Sebastian Castaño Arango", "3207139262", true),
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
              )
            ],
          )),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 0,
      ),
    );
  }
}
