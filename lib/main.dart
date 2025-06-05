import 'package:flutter/material.dart';
import 'package:hermes/models/index.dart';
import 'presentation/screens/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    "/": (context) => LoginScreen(),
    "/home": (context) => const HomeScreen(),
    "/package": (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return PackageScreen(
        package: args['package'] as PackageModel,
        idDate: args['idDate'] as int,
      );
    },
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
