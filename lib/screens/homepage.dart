
import 'package:body_optimizer/screens/mainpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  late DateTime now;
  late DateTime firstDay;
  late DateTime lastDay;

  CalendarFormat _calendarFormat = CalendarFormat.week;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  // DATE VARIABLES FOR CALENDAR //
  DateTime selectedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.week;

  // VARIABLES FROM OTHER SITES (for now placeholder) //
  int numOfExercises = 0;
  String workoutName = "Custom workout 1";

  // PROGRESS BAR //
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Body optimizer",
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 42,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Row(
                  children: [
                    Text(
                      "This week",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  // Use `CalendarStyle` to customize the UI
                  outsideDaysVisible: false,
                ),
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                  });
                },
                onPageChanged: (focusedDay) {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // -------- LOADING BAR ------- //
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.92,
                      child: GFProgressBar(
                        percentage: progress,
                        lineHeight: 35,
                        alignment: MainAxisAlignment.spaceBetween,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: Colors.black26,
                        progressBarColor: PublicVariables().activeColor,
                        child: Center(
                          child: Text(
                            "${((progress + 0.01) * 100).round()}%",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$numOfExercises exercises left",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Tomorrow",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      workoutName,
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
