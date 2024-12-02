import 'package:flutter/material.dart';
import 'package:hermes/presentation/values.dart';

class DatainfoWidget extends StatelessWidget {
  const DatainfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listPackage = [
      {
        "nombre": "Brayan Sanchez",
        "celular": "6947136995",
        "estado": true,
      },
      {
        "nombre": "Alan Sanchez",
        "celular": "6947136995",
        "estado": false,
      }
    ];

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.phone,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    listPackage[0]["estado"] ? Icons.cancel : Icons.check,
                    color: listPackage[0]["estado"] ? Colors.red : Colors.green,
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalValue, vertical: verticalValue),
            child: Row(
              children: [
                Text(listPackage[0]["nombre"]),
                Text(listPackage[0]["celular"]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
