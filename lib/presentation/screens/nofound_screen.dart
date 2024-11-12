import 'package:flutter/material.dart';

class NofoundScreen extends StatelessWidget {
  const NofoundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(children: [
        Text("La pagina a la que intentas acceder no existe")
      ])),
    );
  }
}
