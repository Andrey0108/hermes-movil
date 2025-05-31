import 'package:flutter/material.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/presentation/values.dart';

class PackageItem extends StatelessWidget {
  const PackageItem({super.key, required this.package});

  final PackageModel package;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: elevationValue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
          side: BorderSide(color: Colors.black, width: borderWidthValue),
        ),
        shadowColor: Colors.black,
        borderOnForeground: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalValue,
            vertical: verticalValue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("📝 Nombre: ${package.name}")],
          ),
        ),
      ),
    );
  }
}
