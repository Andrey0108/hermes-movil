import 'package:flutter/material.dart';
import 'package:hermes/data/data.dart';
import 'package:hermes/widgets/card/card_widget.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listCard.length,
        itemBuilder: (context, index) {
          return CardWidget(
            card: listCard[index],
          );
        });
  }
}
