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
  late Future<List<ReservationModel>> reservationsFuture;
  late List<UserModel> travelers;

  @override
  void initState() {
    super.initState();
    reservationsFuture = getTravelersByProgramming(widget.idDate);
  }

  UserModel getInfoUser(int idUser) {
    return travelers.firstWhere(
      (traveler) => traveler.id == idUser,
      orElse: () => UserModel(
        id: 0,
        idRole: 0,
        typeDocument: '',
        document: '',
        name: '',
        surName: '',
        dateBirth: DateTime.now(),
        email: '',
        idMunicipality: 0,
        phone: '',
        status: false,
        activate: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.package.name)),
      body: FutureBuilder<List<ReservationModel>>(
        future: reservationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No travelers found for this programming.'),
            );
          } else {
            travelers = snapshot.data!
                .expand((reservation) => reservation.detailReservationTravelers)
                .map((traveler) => getInfoUser(traveler.idTraveler))
                .toSet()
                .toList();
            return TravelList(
              items: travelers,
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
