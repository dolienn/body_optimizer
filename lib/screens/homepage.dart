import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // TEXT STYLE DEFINITION //
  static const TextStyle headerText = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.w600
  );
  static const TextStyle normalText = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 24,
      fontStyle: FontStyle.italic
  );

  // DATE VARIABLES FOR CALENDAR //
  DateTime focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  var _calendarFormat = CalendarFormat.month;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(children: [
        Row(children: const [
          Text("This week", style: headerText),
        ]),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              focusedDay = focusedDay;
            });
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onPageChanged: (focusedDay) {
            focusedDay = focusedDay;
          },
        ),

        Row(children: const [
          Text("Today", style: headerText),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 150, height: 20,
              child: ColoredBox(
                color: Color(0xff5650DE),
              ),
            ),
            SizedBox(
              width: 150, height: 20,
              child: ColoredBox(
                color: Colors.grey,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("0 exercises left", style: normalText),
          ],
        ),
        Row(children: const [
          Text("Tomorrow", style: headerText),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Custom Workout", style: normalText)],
        ),
      ]),
    );
  }
}
