import 'package:flutter/material.dart';
import 'package:hermes/models/index.dart';
import 'package:hermes/presentation/values.dart';
import 'package:hermes/services/index.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  List<PackageModel> packages = [];
  List<ProgrammingModel> programming = [];
  UserModel? currentUser; // Variable para almacenar el usuario actual

  @override
  void initState() {
    super.initState();
    _loadPackages();
    _loadCurrentUser(); // Cargar usuario actual
  }

  Future<void> _loadPackages() async {
    try {
      final fetchedPackages = await getAllPackages();
      setState(() {
        packages = fetchedPackages;
        print(fetchedPackages);
      });
    } catch (e) {
      print('Error loading packages: $e');
    }
  }

  Future<void> _loadCurrentUser() async {
    try {
      final userMap = await getCurrentUser(); // Obtener usuario actual
      final user = UserModel.fromJson(userMap as Map<String, dynamic>);
      setState(() {
        currentUser = user;
      });
      if (user.idRole == 1 || user.idRole == 2) {
        _loadProgrammingByResponsible(user.id);
      }
    } catch (e) {
      print('Error loading current user: $e');
    }
  }

  Future<void> _loadProgrammingByResponsible(int userId) async {
    try {
      final fetchedProgramming = await getAllByResponsible(userId);
      setState(() {
        programming = fetchedProgramming;
        print(fetchedProgramming);
      });
    } catch (e) {
      print('Error loading programming by responsible: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue,
        vertical: verticalValue,
      ),
      child: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 7,
        dataSource: PackageDataSource(_convertProgrammingToAppointments()),
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.targetElement == CalendarElement.appointment) {
            final appointment =
                calendarTapDetails.appointments!.first as Appointment;
            final package = packages.firstWhere(
              (pkg) =>
                  pkg.id ==
                  programming
                      .firstWhere((prog) => prog.id == appointment.id)
                      .idPackage,
              orElse: () => PackageModel(
                id: 0,
                name: 'Paquete desconocido',
                idActivity: 0,
                idMunicipality: 0,
                level: 0,
                price: 0,
                reserve: 0,
                description: 'No hay descripción disponible',
                image: 'default_image.png',
                detailPackagesServices: [],
                status: false,
              ),
            );
            Navigator.pushNamed(
              context,
              "/package",
              arguments: {
                'package': package,
                'idDate': appointment.id,
              }, // Pass package and idDate
            );
          }
        },
      ),
    );
  }

  List<Appointment> _convertProgrammingToAppointments() {
    return programming.map((program) {
      try {
        final package = packages.firstWhere(
          (pkg) => pkg.id == program.idPackage,
          orElse: () => PackageModel(
            id: 0,
            name: 'Paquete desconocido',
            idActivity: 0,
            idMunicipality: 0,
            level: 0,
            price: 0,
            reserve: 0,
            description: 'No hay descripción disponible',
            image: 'default_image.png', // Imagen por defecto
            detailPackagesServices: [],
            status: false,
          ),
        );

        return Appointment(
          id: program.id,
          startTime: program.start,
          endTime: program.end,
          isAllDay: true,
          subject: package.name,
          notes: package.description,
          color: program.status
              ? (package.status ? Colors.green : Colors.red)
              : Colors.grey,
        );
      } catch (e) {
        return Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          isAllDay: true,
          subject: 'Error al cargar paquete',
          color: Colors.grey,
        );
      }
    }).toList();
  }
}

class PackageDataSource extends CalendarDataSource {
  PackageDataSource(List<Appointment> source) {
    appointments = source;
  }
}
