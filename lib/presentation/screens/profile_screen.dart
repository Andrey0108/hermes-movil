import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';
import 'package:hermes/presentation/widgets/profile/data_widget.dart';
import 'package:hermes/services/index.dart';

import '../values.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? currentUser;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final userProfile = await getProfile();
      setState(() {
        currentUser = {
          'name': userProfile.name,
          'surName': userProfile.surName,
          'email': userProfile.email,
          'phone': userProfile.phone,
        };
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al cargar el perfil: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Perfil"),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade100],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(horizontalValue),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalValue,
                    vertical: verticalValue,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[400],
                    borderRadius: BorderRadius.circular(borderRadiusValue),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalValue,
                          vertical: verticalValue,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.person,
                          size: iconSize,
                          color: Colors.lightBlue[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: verticalValue),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusValue),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(horizontalValue),
                    child: Column(
                      children: [
                        DataWidget(
                          hintText: "Nombres",
                          dataText: currentUser?['name'] ?? "N/A",
                        ),
                        DataWidget(
                          hintText: "Apellidos",
                          dataText: currentUser?['surName'] ?? "N/A",
                        ),
                        DataWidget(
                          hintText: "Correo",
                          dataText: currentUser?['email'] ?? "N/A",
                        ),
                        DataWidget(
                          hintText: "Teléfono",
                          dataText: currentUser?['phone'] ?? "N/A",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: verticalValue),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
                      elevation: 5,
                    ),
                    onPressed: () async {
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MenuWidget(currentIndex: 1),
    );
  }
}
