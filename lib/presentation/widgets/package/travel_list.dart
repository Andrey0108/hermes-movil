import 'package:flutter/material.dart';
import 'package:hermes/models/user_model.dart';
import 'package:hermes/presentation/widgets/package/travel_item.dart';

class TravelList extends StatelessWidget {
  const TravelList({super.key, required this.items});

  final List<UserModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TravelItem(user: items[index]);
      },
    );
  }
}
