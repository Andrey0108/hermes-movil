import 'package:flutter/material.dart';
import 'presentation/screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    "/": (context) => const LoginScreen(),
    "/home": (context) => const HomeScreen(),
    "/package": (context) => PackageScreen(),
    "/profile": (context) => const ProfileScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hermes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        fontFamily: "greycliff",
      ),
      initialRoute: "/",
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NofoundScreen());
      },
    );
  }
}
