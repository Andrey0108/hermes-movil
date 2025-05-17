import 'package:flutter/material.dart';
import 'package:hermes/models/user_model.dart';
import 'package:hermes/presentation/values.dart';

class TravelItem extends StatelessWidget {
  const TravelItem({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: elevationValue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
        ),
        shadowColor: user.status == true ? Colors.green : Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                  side: BorderSide(
                    color: user.status == true ? Colors.green : Colors.red,
                    width: borderWidthValue,
                  ),
                ),
                child: Icon(Icons.person, size: iconSizeMd),
              ),
            ),
            SizedBox(
              width: 180,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.phone),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.cancel)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
