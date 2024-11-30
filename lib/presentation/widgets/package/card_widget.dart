import 'package:flutter/material.dart';
import 'package:hermes/presentation/values.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String nombre = "Juan Quintero";
    String contacto = "3332550534";
    bool viaja = true;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusValue),
      ),
      shadowColor: viaja == true ? Colors.green : Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalValue, horizontal: horizontalValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nombre),
                Text(contacto),
              ],
            ),
          ),
          TextButton(
            child: Text(viaja == true ? 'Viaja' : 'No viaja',
                style: TextStyle(
                    fontSize: fontSize,
                    color: viaja == true
                        ? Colors.green[colorValue]
                        : Colors.red[colorValue])),
            onPressed: () {/* ... */},
          ),
        ],
      ),
    );
  }
}
