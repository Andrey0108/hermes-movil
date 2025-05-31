// ignore_for_file: library_private_types_in_public_api, avoid_print
import 'package:flutter/material.dart';
import 'package:hermes/presentation/values.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
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
        //initialDisplayDate: DateTime(2021, 03, 01, 08, 30),
        //initialSelectedDate: DateTime(2021, 03, 01, 08, 30),
        dataSource: PackageDataSource(getAppointments()),
        onTap: (calendarTapDetails) => {
          if (calendarTapDetails.targetElement == CalendarElement.appointment)
            Navigator.pushNamed(context, "/package"),
        },
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> packages = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(
    today.year,
    today.month,
    today.day,
    6,
    0,
    0,
  );
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  packages.add(
    Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Cartagena',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
      isAllDay: false,
    ),
  );

  return packages;
}

class PackageDataSource extends CalendarDataSource {
  PackageDataSource(List<Appointment> source) {
    appointments = source;
  }
}
