import 'package:flutter/material.dart';
import 'package:hermes/data/models/package/package_model.dart';
import 'presentation/screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    "/": (context) => const LoginScreen(),
    "/home": (context) => const HomeScreen(),
    "/package": (context) => PackageScreen(
          package: Package(
              1,
              "MAMM",
              "Lunes 02 de Diciembre del 2024",
              [
                "Desayuno",
                "Almuerzo",
                "Cena",
                "Hospedaje",
                "Transporte",
              ],
              1),
        ),
    "/profile": (context) => const ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hermes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          fontFamily: "greycliff",
        ),
        initialRoute: "/",
        routes: _routes,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const NofoundScreen(),
          );
        });
  }
}
