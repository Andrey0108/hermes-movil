import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/image_widget.dart';
import 'package:hermes/presentation/widgets/login/field_widget.dart';

import '../values.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Iniciar sesión",
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
          const ImageWidget(image: "hermes.png"),
          const Column(
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
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[colorValue],
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
              // redirigir a la pantalla de home
              Navigator.pushReplacementNamed(context, "/home");
            },
            child: const Text("Ingresar"),
          )
          // Add the login form here
        ],
      ),
    );
  }
}
