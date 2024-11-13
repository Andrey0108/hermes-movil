import 'package:flutter/material.dart';
import 'presentation/screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    "/": (context) => const LoginScreen(),
    "/home": (context) => const HomeScreen(),
    "/profile": (context) => const ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hermes',
        initialRoute: "/",
        routes: _routes,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const NofoundScreen(),
          );
        });
  }
}
