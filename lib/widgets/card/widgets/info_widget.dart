import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.status,
    required this.name,
    required this.phone,
    required this.email,
  });

  final bool status;
  final String name;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.black45,
      fontSize: 24,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.info,
          color: status ? Colors.green : Colors.red,
        ),
        Column(
          children: [
            Text(
              name,
              style: nameStyle,
            ),
            Column(
              children: [
                Text(phone),
                Text(email),
              ],
            ),
          ],
        )
      ],
    );
  }
}
