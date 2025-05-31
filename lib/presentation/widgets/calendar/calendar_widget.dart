// ignore_for_file: library_private_types_in_public_api, avoid_print
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
  List<Package> packages = [];

  @override
  void initState() {
    super.initState();
    _loadPackages();
  }

  Future<void> _loadPackages() async {
    try {
      final fetchedPackages = await getAllPackages();
      setState(() {
        packages = fetchedPackages;
      });
    } catch (e) {
      print('Error loading packages: $e');
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
        dataSource: PackageDataSource(_convertPackagesToAppointments()),
        onTap: (calendarTapDetails) => {
          if (calendarTapDetails.targetElement == CalendarElement.appointment)
            Navigator.pushNamed(context, "/package"),
        },
      ),
    );
  }

  List<Appointment> _convertPackagesToAppointments() {
    return packages.map((package) {
      return Appointment(
        startTime: package.startTime,
        endTime: package.endTime,
        subject: package.name,
        color:
            Colors.blue, // Puedes ajustar el color según el estado del paquete
      );
    }).toList();
  }
}

class PackageDataSource extends CalendarDataSource {
  PackageDataSource(List<Appointment> source) {
    appointments = source;
  }
}
