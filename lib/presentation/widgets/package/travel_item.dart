import 'package:flutter/material.dart';
import 'package:hermes/data/models/travel/travel_model.dart';
import 'package:hermes/presentation/values.dart';

class TravelItem extends StatelessWidget {
  const TravelItem({super.key, required this.travel});

  final Travel travel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevationValue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadiusValue,
        ),
      ),
      shadowColor: travel.viaja == true ? Colors.green : Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(travel.nombre),
              Text(travel.contacto),
            ],
          ),
          TextButton(
            child: Text(travel.viaja == true ? 'Viaja' : 'No viaja',
                style: TextStyle(
                    fontSize: fontSize,
                    color: travel.viaja == true
                        ? Colors.green[colorValue]
                        : Colors.red[colorValue])),
            onPressed: () {/* ... */},
          ),
        ],
      ),
    );
  }
}
