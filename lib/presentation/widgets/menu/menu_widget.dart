import 'package:flutter/material.dart';
import 'package:hermes/presentation/screens/home_screen.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  List<Widget> items = [const HomeScreen()];
  int optionMenu = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => {
        setState(() {
          optionMenu = value;
        })
      },
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Programación",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "Perfil",
        ),
      ],
    );
  }
}
