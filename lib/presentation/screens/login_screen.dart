import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/image_widget.dart';
import 'package:hermes/presentation/widgets/login/field_widget.dart';
import 'package:hermes/services/index.dart';

import '../values.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade100],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Iniciar sesión",
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const ImageWidget(image: "hermes.png"),
                      const SizedBox(height: 30),
                      FieldWidget(
                        hintText: "Correo",
                        oscureText: false,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 20),
                      FieldWidget(
                        hintText: "Contraseña",
                        oscureText: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue[400],
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalValue,
                              vertical: verticalValue,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                borderRadiusValue,
                              ),
                            ),
                            elevation: 5,
                          ),
                          onPressed: () async {
                            final email = _emailController.text.trim();
                            final password = _passwordController.text.trim();

                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Por favor, complete todos los campos',
                                  ),
                                ),
                              );
                              return;
                            }

                            try {
                              final response = await login(email, password);

                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  "/home",
                                );
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
                                SnackBar(
                                  content: Text('Error al iniciar sesión: $e'),
                                ),
                              );
                            }
                          },
                          child: const Text("Ingresar"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
