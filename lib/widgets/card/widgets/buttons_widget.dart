import 'package:flutter/material.dart';
import './buttons/liked_button_widget.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const styleButton = TextStyle(
      color: Colors.black45,
      fontWeight: FontWeight.bold,
    );
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const LikedButtonWidget(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Comentar',
                style: styleButton,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Compartir',
                style: styleButton,
              ),
            ),
          ],
        ));
  }
}
