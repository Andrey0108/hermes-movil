import 'package:flutter/material.dart';
import 'package:hermes/presentation/widgets/calendar/calendar_widget.dart';
import 'package:hermes/presentation/widgets/menu/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Paquetes',
            style: TextStyle(
              color: Colors.black45,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: const CalendarWidget(),
      bottomNavigationBar: const MenuWidget(
        currentIndex: 0,
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
