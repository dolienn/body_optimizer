import 'package:body_optimizer/screens/settings.dart';
import 'package:body_optimizer/screens/workout.dart';
import 'package:body_optimizer/screens/workoutcreator.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TEXT STYLE //
  static const TextStyle titleText = TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.black,
    fontSize: 42,
  );
  static const TextStyle headerText = TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.black,
    fontSize: 36,
  );
  static const TextStyle normalText = TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.black,
    fontSize: 20,
    fontStyle: FontStyle.italic,
  );

  // DATE VARIABLES FOR CALENDAR //
  DateTime _selectedDay = DateTime.now();
  var _calendarFormat = CalendarFormat.week;

  // VARIABLES FROM OTHER SITES (for the time placeholder) //
  int numOfExercises = 0;
  String workoutName = "Custom workout 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 25.0),
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
                        children: const [
                          Text("Body optimizer", style: titleText)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: const [Text("This week", style: headerText)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [Text("Today", style: headerText)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                          // PROGRESS BAR ADD //
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("$numOfExercises exercises left",
                              style: normalText)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [Text("Tomorrow", style: headerText)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(workoutName, style: normalText)],
                      ),
                    ),
                  ],
                ),
              ),
              /* ------ NavBar (Nie działa) ----- /
              PersistentTabView(
                context,
                screens: const [
                  MyHomePage(),
                  Workout(),
                  WorkoutCreator(),
                  Settings()
                ],
                items: [
                  PersistentBottomNavBarItem(
                    icon: const Icon(CupertinoIcons.home),
                    title: "Home",
                    activeColorPrimary: Colors.purple,
                    inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: const Icon(Icons.note_add_outlined),
                    title: "Workout Creator",
                    activeColorPrimary: Colors.purple,
                    inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: const Icon(Icons.fitness_center_outlined),
                    title: "Workout",
                    activeColorPrimary: Colors.purple,
                    inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: const Icon(CupertinoIcons.settings),
                    title: "Settings",
                    activeColorPrimary: Colors.purple,
                    inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                ],
                backgroundColor: Colors.white,
                resizeToAvoidBottomInset: true,
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  colorBehindNavBar: Colors.white,
                ),
                navBarStyle: NavBarStyle.style10,
              ),
               */
            ],
          ),
        ),
      ),
    );
  }
}

