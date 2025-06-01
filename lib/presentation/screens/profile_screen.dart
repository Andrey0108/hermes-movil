import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';
import 'package:hermes/presentation/widgets/profile/data_widget.dart';
import 'package:hermes/services/index.dart';

import '../values.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Perfil"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              child: Icon(Icons.person, size: iconSize, color: Colors.white),
            ),
            const Column(
              children: [
                DataWidget(hintText: "Nombres", dataText: "Alan Andrey"),
                DataWidget(hintText: "Apellidos", dataText: "Sanchez Caro"),
                DataWidget(
                  hintText: "Correo",
                  dataText: "alansanchez123@gmail.com",
                ),
                DataWidget(hintText: "Teléfono", dataText: "3011111111"),
                DataWidget(hintText: "Dirección", dataText: "Cl 9 # 9-9"),
              ],
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
              onPressed: () async {
                // Aquí se llamaría al servicio de logout
                final response = await logout();
                if (response) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sesión cerrada correctamente'),
                    ),
                  );
                  Navigator.pushReplacementNamed(context, "/");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al cerrar sesión')),
                  );
                }
              },
              child: const Text("Cerrar sesión"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuWidget(currentIndex: 1),
    );
  }
}
