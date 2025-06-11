import 'package:flutter/material.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/presentation/widgets/package/travel_list.dart';
import 'package:hermes/services/client_service.dart';
import 'package:hermes/services/reservation_service.dart';

class PackageScreen extends StatefulWidget {
  final PackageModel package;
  final int idDate;

  const PackageScreen({super.key, required this.package, required this.idDate});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  List<ReservationModel> reservationsFuture = [];
  List<UserModel> clients = [];

  @override
  void initState() {
    super.initState();
    _loadClients();
    _loadReservations();
  }

  Future<void> _loadClients() async {
    try {
      final fetchedClients = await getAllClients();
      setState(() {
        clients = fetchedClients;
      });
    } catch (e) {
      throw Exception('Error al cargar los clientes: $e');
    }
  }

  Future<void> _loadReservations() async {
    try {
      print(widget.idDate);
      final fetchedReservations = await getTravelers(widget.idDate);
      setState(() {
        reservationsFuture = fetchedReservations;
        print(fetchedReservations);
      });
    } catch (e) {
      throw Exception('Error al cargar las reservas: $e');
    }
  }

  UserModel? getClientInfo(int idTraveler) {
    return clients.firstWhere((client) => client.id == idTraveler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.package.name)),
      body: FutureBuilder<List<ReservationModel>>(
        future: Future.value(reservationsFuture),
        builder: (context, snapshot) {
          final travelers = snapshot.data!
              .expand((reservation) => reservation.detailReservationTravelers)
              .map(
                (traveler) => ReservationTravelerModel.fromJson(
                  traveler as Map<String, dynamic>,
                ),
              )
              .toList();

          return TravelList<ReservationTravelerModel>(
            items: travelers,
            itemBuilder: (context, traveler) {
              final client = getClientInfo(traveler.idTraveler);
              return ListTile(
                title: Text('${client?.name} ${client?.surName}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Document: ${client?.document}'),
                    Text('Phone: ${client?.phone}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
