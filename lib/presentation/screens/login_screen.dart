import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/image_widget.dart';
import 'package:hermes/presentation/widgets/login/field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      title(),
      const ImageWidget(image: "hermes.png"),
      loginForm(),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // redirigir a la pantalla de home
          Navigator.pushReplacementNamed(context, "/home");
        },
        child: const Text("Ingresar"),
      )
      // Add the login form here
    ]));
  }
}

Widget title() {
  return const Center(
    child: Text(
      "Iniciar sesión",
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
    ),
  );
}

Widget loginForm() {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FieldWidget(
        hintText: "Correo",
        oscureText: false,
      ),
      FieldWidget(
        hintText: "Contraseña",
        oscureText: true,
      ),
    ],
  );
}
