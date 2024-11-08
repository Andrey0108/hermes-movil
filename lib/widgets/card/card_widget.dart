import 'package:flutter/material.dart';
import 'package:hermes/widgets/card/widgets/description_widget.dart';
import './widgets/info_widget.dart';
import './widgets/buttons_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.card,
  });

  final Map<String, dynamic> card;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: InfoWidget(
              status: card["status"],
              name: card["name"],
              phone: card["phone"],
              email: card["email"],
            ),
          ),
          DescriptionWidget(description: card["description"]),
          const ButtonsWidget(),
        ],
      ),
    );
  }
}
