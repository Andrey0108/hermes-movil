import 'package:flutter/material.dart';
import 'package:hermes/screens/login_screen.dart';
import 'package:hermes/screens/home_screen.dart';
import 'package:hermes/screens/nofound_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hermes',
      initialRoute: "/"
      routes: {
        "/": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),
      },
      onGenerateRoute: (settings){
      return MaterialPageRoute(
        builder: (context) => NofoundScreen()
      )
      }
    );
  }
}
