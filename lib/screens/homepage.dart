import 'package:body_optimizer/screens/mainpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TEXT STYLE //

  // DATE VARIABLES FOR CALENDAR //
  DateTime _selectedDay = DateTime.now();
  var _calendarFormat = CalendarFormat.week;

  // VARIABLES FROM OTHER SITES (for now placeholder) //
  int numOfExercises = 0;
  String workoutName = "Custom workout 1";

  // PROGRESS BAR //
  // Variables
  double progress = 0.0;
  // Initialization
  @override
  void initState() {
    late Timer timer;
    timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      setState(() {
        progress += 0.01;
        if (progress >= 0.99) {
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              Color(0xFFCECECE),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 25.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "This week",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 36,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: DateTime.now(),
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                              });
                            },
                            calendarFormat: _calendarFormat,
                            onFormatChanged: (format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            },
                            onPageChanged: (focusedDay) {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Text(
                                "Today",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 36,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 320,
                                child: GFProgressBar(
                                  percentage: progress,
                                  lineHeight: 35,
                                  alignment: MainAxisAlignment.spaceBetween,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  leading: const Icon(
                                    Icons.sentiment_dissatisfied_outlined,
                                    color: Colors.red,
                                    size: 34,
                                  ),
                                  trailing: const Icon(
                                    Icons.sentiment_satisfied_alt_outlined,
                                    color: Colors.green,
                                    size: 34,
                                  ),
                                  backgroundColor: Colors.black26,
                                  progressBarColor:
                                      PublicVariables().activeColor,
                                  child: Center(
                                    child: Text(
                                      "${((progress + 0.01) * 100).round()}%",
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$numOfExercises exercises left",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Text(
                                "Tomorrow",
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 36,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                workoutName,
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
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
      ),
    );
  }
}
