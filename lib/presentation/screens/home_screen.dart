import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/appbar_widget.dart';
import 'package:hermes/presentation/widgets/calendar/calendar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: "Calendario",
      ),
      body: CalendarWidget(),
      bottomNavigationBar: MenuWidget(
        currentIndex: 0,
      ),
    );
  }
}
