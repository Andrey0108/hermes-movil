import 'package:flutter/material.dart';

class TravelList<T> extends StatelessWidget {
  const TravelList({super.key, required this.items, required this.itemBuilder});

  final List<T> items;
  final Widget Function(BuildContext, T) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return itemBuilder(context, items[index]);
      },
    );
  }
}
