import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/image_widget.dart';
import 'package:hermes/presentation/widgets/login/field_widget.dart';
import 'package:hermes/services/index.dart';

import '../values.dart';

class LoginScreen extends StatelessWidget {
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:4184187990.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Iniciar sesión", style: TextStyle(fontSize: fontSize)),
          const ImageWidget(image: "hermes.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FieldWidget(
                hintText: "Correo",
                oscureText: false,
                controller: _emailController,
              ),
              SizedBox(height: 20),
              FieldWidget(
                hintText: "Contraseña",
                oscureText: true,
                controller: _passwordController,
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
            onPressed: () async {
              final email = _emailController.text.trim();
              final password = _passwordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Por favor, complete todos los campos'),
                  ),
                );
                return;
              }

              try {
                final response = await login(email, password);

                if (response.statusCode == 200 || response.statusCode == 201) {
                  Navigator.pushReplacementNamed(context, "/home");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Error de inicio de sesión: ${response.statusCode}',
                      ),
                    ),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al iniciar sesión: $e')),
                );
              }
            },
            child: const Text("Ingresar"),
          ),
        ],
      ),
    );
  }
}
