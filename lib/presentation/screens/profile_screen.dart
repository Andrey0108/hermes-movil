import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';
import 'package:hermes/presentation/widgets/profile/data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalValue = 20;
    double verticalValue = 10;
    double borderRadiusValue = 8.0;

    double iconSize = 100;

    return Scaffold(
      appBar: const AppBarWidget(
        title: "Perfil",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalValue,
              vertical: verticalValue,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
            child: Icon(
              Icons.person,
              size: iconSize,
              color: Colors.white,
            ),
          ),
          const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DataWidget(hintText: "Nombres", dataText: "Alan Andrey"),
                DataWidget(hintText: "Apellidos", dataText: "Sanchez Caro"),
                DataWidget(
                    hintText: "Correo", dataText: "alansanchez123@gmail.com"),
                DataWidget(hintText: "Teléfono", dataText: "3011111111"),
                DataWidget(hintText: "Dirección", dataText: "Cl 9 # 9-9"),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[700],
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalValue,
                vertical: verticalValue,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
            child: const Text("Cerrar sesión"),
          ),
        ],
      ),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 1,
      ),
    );
  }
}
