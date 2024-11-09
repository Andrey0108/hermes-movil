import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const NofoundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        Column(
            children:[
                Text("La pagina a la que intentas acceder no existe")
            ]
        )
      ),
    );
  }
}
