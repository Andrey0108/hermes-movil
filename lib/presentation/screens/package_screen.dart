import 'package:flutter/material.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/presentation/widgets/package/travel_list.dart';
import 'package:hermes/services/client_service.dart';
import 'package:hermes/services/reservation_service.dart';
import 'package:hermes/presentation/values.dart';

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
      final fetchedReservations = await getTravelers(widget.idDate);
      setState(() {
        reservationsFuture = fetchedReservations;
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
      appBar: AppBar(
        title: Text(widget.package.name),
        backgroundColor: Colors.lightBlue.shade400,
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      backgroundColor: Colors.lightBlue.shade50,
      body: FutureBuilder<List<ReservationModel>>(
        future: Future.value(reservationsFuture),
        builder: (context, snapshot) {
          final travelers = snapshot.data!
              .expand((reservation) => reservation.detailReservationTravelers)
              .toList();

          return TravelList<ReservationTravelerModel>(
            items: travelers,
            itemBuilder: (context, traveler) {
              final client = getClientInfo(traveler.idTraveler);
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: horizontalValue,
                  vertical: verticalValue / 2,
                ),
                child: Card(
                  elevation: elevationValue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusValue),
                  ),
                  shadowColor: Colors.lightBlue.withOpacity(0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlue.shade100,
                          Colors.lightBlue.shade50,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(borderRadiusValue),
                      border: Border.all(
                        color: Colors.lightBlue.shade200,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(horizontalValue),
                      child: Row(
                        children: [
                          // Avatar del cliente
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade400,
                              borderRadius: BorderRadius.circular(
                                borderRadiusValue,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.lightBlue.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Información del cliente
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Nombre del cliente
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue.shade300,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '${client?.name} ${client?.surName}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Documento
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.badge,
                                        size: 16,
                                        color: Colors.lightBlue.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Doc: ${client?.document}',
                                        style: TextStyle(
                                          color: Colors.lightBlue.shade700,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                // Celular
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue.shade200,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 16,
                                        color: Colors.lightBlue.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Tel: ${client?.phone}',
                                        style: TextStyle(
                                          color: Colors.lightBlue.shade700,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
