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
  List<PackageModel> packages = [];
  List<ProgrammingModel> programming = [];

  @override
  void initState() {
    super.initState();
    _loadPackages();
    _loadProgramming();
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

  Future<void> _loadProgramming() async {
    try {
      final fetchedProgramming = await getAllByResponsible();
      setState(() {
        programming = fetchedProgramming;
      });
    } catch (e) {
      print('Error loading programming: $e');
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
        onTap: (calendarTapDetails) => {
          if (calendarTapDetails.targetElement == CalendarElement.appointment)
            Navigator.pushNamed(context, "/package"),
        },
      ),
    );
  }

  List<Appointment> _convertProgrammingToAppointments() {
    return programming.map((program) {
      return Appointment(
        startTime: program.start,
        endTime: program.end,
        subject: packages.firstWhere((pkg) => pkg.id == program.idPackage).name,
        color: program.status
            ? packages.firstWhere((pkg) => pkg.id == program.idPackage).status
                  ? Colors.green
                  : Colors.red
            : Colors.grey,
      );
    }).toList();
  }
}

class PackageDataSource extends CalendarDataSource {
  PackageDataSource(List<Appointment> source) {
    appointments = source;
  }
}
