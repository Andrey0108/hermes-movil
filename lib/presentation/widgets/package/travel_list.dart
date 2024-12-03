import 'package:flutter/material.dart';
import 'package:hermes/data/models/travel/travel_model.dart';
import 'package:hermes/presentation/widgets/package/travel_item.dart';

class TravelList extends StatelessWidget {
  const TravelList({
    super.key,
    required this.items,
  });
  final List<Travel> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TravelItem(travel: items[index]);
      },
    );
  }
}
