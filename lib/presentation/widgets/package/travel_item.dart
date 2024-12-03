import 'package:flutter/material.dart';
import 'package:hermes/data/models/travel/travel_model.dart';
import 'package:hermes/presentation/values.dart';

class TravelItem extends StatelessWidget {
  const TravelItem({super.key, required this.travel});

  final Travel travel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: elevationValue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadiusValue,
          ),
        ),
        shadowColor: travel.viaja == true ? Colors.green : Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadiusValue,
                  ),
                  side: BorderSide(
                    color: travel.viaja == true ? Colors.green : Colors.red,
                    width: borderWidthValue,
                  ),
                ),
                child: Icon(
                  Icons.person,
                  size: iconSizeMd,
                ),
              ),
            ),
            SizedBox(
              width: 180,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(travel.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(travel.contacto),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.cancel)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
