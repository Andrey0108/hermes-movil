import 'package:flutter/material.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/services/reservation_service.dart';
import 'package:hermes/presentation/widgets/package/travel_list.dart';

class PackageScreen extends StatefulWidget {
  final PackageModel package;
  final int idDate;

  const PackageScreen({super.key, required this.package, required this.idDate});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  late Future<List<UserModel>> travelersFuture;

  @override
  void initState() {
    super.initState();
    travelersFuture = getTravelersByProgramming(widget.idDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.package.name)),
      body: FutureBuilder<List<UserModel>>(
        future: travelersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No travelers found.'));
          } else {
            return TravelList(
              items: snapshot.data!,
              itemBuilder: (context, traveler) {
                return ListTile(
                  title: Text(traveler.name),
                  subtitle: Text(traveler.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
