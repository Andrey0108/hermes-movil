import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Perfil',
            style: TextStyle(
              color: Colors.black45,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: const Column(
          children: [
            Text(
              "Nombre",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Nombre",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Contraseña",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Contraseña",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 1,
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
