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
            Navigator.pushNamed(context, "/package");
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
            name: 'Unknown Package',
            idActivity: 0,
            idMunicipality: 0,
            level: 0,
            price: 0,
            reserve: 0,
            description: 'No description available',
            image: 'default_image.png', // Provide a default image
            detailPackagesServices: [],
            status: false,
          ),
        );
        return Appointment(
          startTime: program.start,
          endTime: program.end,
          subject: package.name,
          color: program.status
              ? package.status
                    ? Colors.green
                    : Colors.red
              : Colors.grey,
        );
      } catch (e) {
        print('Error mapping program to appointment: $e');
        return Appointment(
          startTime: program.start,
          endTime: program.end,
          subject: 'Unknown Package',
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
