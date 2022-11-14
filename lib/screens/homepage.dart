import 'package:body_optimizer/screens/mainpage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // VARIABLES FROM OTHER SITES (for now placeholder) //
  String workoutToday = "Abs workout",
      workoutToday2 = "Back workout",
      workoutTomorrow = "Custom workout",
      workoutTomorrow2 = "Custom workout 2";
  int numOfExercises = 5, numOfExercisesLeft = 2;

  // TABLE CALENDAR //
  final titleController = TextEditingController(),
      descpController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  Map<String, List> mySelectedEvents = {};
  DateTime today = DateTime.now(), _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)] != null) {
      return mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)]!;
    }
    return [];
  }

  // PROGRESS BAR //
  double currentProgress = 0.0, displayedProgress = 0.0;

  @override
  void initState() {
    super.initState();
    currentProgress =
        1.0 - (((numOfExercisesLeft * 100 / numOfExercises).round()) / 100);
    if (currentProgress == 0.99) {
      displayedProgress = currentProgress + 0.01;
    } else {
      displayedProgress = currentProgress;
    }
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            padding: const EdgeInsets.only(top: 5, bottom: 10, left: 20),
            decoration: BoxDecoration(
              color: PublicVariables().mainColor,
            ),
            child: SafeArea(
              child:
                  Text("Body optimizer", style: PublicVariables().bannerText),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 7.5),
            child: Column(children: [
              Container(
                margin: PublicVariables().marginSymmetricVertical,
                decoration: BoxDecoration(
                  color: PublicVariables().cardColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.5,
                        offset: Offset(1, 2.5)),
                  ],
                ),
                child: Padding(
                  padding: PublicVariables().paddingAll,
                  child: Column(
                    children: [
                      Row(children: [
                        Text("This week", style: PublicVariables().headerText),
                      ]),
                      Container(
                        margin: PublicVariables().marginSymmetricVertical,
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: TableCalendar(
                          focusedDay: _focusedDay,
                          firstDay: DateTime(2022),
                          lastDay: DateTime(2050),
                          calendarFormat: _calendarFormat,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          rowHeight: 50,
                          daysOfWeekHeight: 25,
                          headerStyle: HeaderStyle(
                            headerMargin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9),
                              ),
                              color:
                                  PublicVariables().mainColor.withOpacity(0.85),
                            ),
                            titleTextStyle: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            formatButtonTextStyle: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                            formatButtonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.white, width: 1.5),
                              color: PublicVariables().mainColor,
                            ),
                            leftChevronIcon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            rightChevronIcon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          daysOfWeekStyle: const DaysOfWeekStyle(
                            weekdayStyle: TextStyle(color: Colors.black54),
                            weekendStyle: TextStyle(color: Colors.black),
                          ),
                          calendarStyle: CalendarStyle(
                            weekendTextStyle:
                                const TextStyle(color: Colors.black),
                            todayDecoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: PublicVariables().mainColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDate, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDate = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            _focusedDay = focusedDay;
                          },
                          eventLoader: _listOfDayEvents,
                        ),
                      ),
                      ..._listOfDayEvents(_selectedDate!).map(
                        (myEvents) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 7.5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    "${myEvents['eventTitle']}",
                                    style: PublicVariables().normalText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  child: Text(
                                    "${myEvents['eventTime']}",
                                    style: PublicVariables().normalText,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              child: Row(children: [
                                Text(
                                  "${myEvents['eventDescp']}",
                                  style: PublicVariables().normalGreyText,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: PublicVariables().marginSymmetricVertical,
                decoration: BoxDecoration(
                  color: PublicVariables().cardColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.5,
                        offset: Offset(1, 2.5)),
                  ],
                ),
                child: Padding(
                  padding: PublicVariables().paddingAll,
                  child: Column(children: [
                    Row(children: [
                      Text("Today", style: PublicVariables().headerText),
                    ]),
                    Column(children: [
                      Padding(
                        padding: PublicVariables().paddingAll,
                        child: Text(
                          workoutToday,
                          style: PublicVariables().subheaderText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: GFProgressBar(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              progressBarColor:
                                  PublicVariables().mainColor.withOpacity(0.9),
                              alignment: MainAxisAlignment.spaceBetween,
                              percentage: currentProgress,
                              lineHeight: 35,
                              backgroundColor: Colors.white30,
                              child: Center(
                                child: Text(
                                  "${((displayedProgress) * 100).round()}%",
                                  style: PublicVariables().normalWhiteText,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: PublicVariables().paddingAll,
                        child: Text(
                          "$numOfExercisesLeft exercise(s) left",
                          style: PublicVariables().normalText,
                        ),
                      ),
                    ]),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: PublicVariables().cardColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.5,
                        offset: Offset(1, 2.5)),
                  ],
                ),
                child: Padding(
                  padding: PublicVariables().paddingAll,
                  child: Column(children: [
                    Row(children: [
                      Text("Tomorrow", style: PublicVariables().headerText),
                    ]),
                    Column(children: [
                      Container(
                        width: 175,
                        height: 50,
                        alignment: Alignment.center,
                        margin: PublicVariables().marginSymmetricVertical,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: PublicVariables().cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.5,
                                offset: Offset(1, 2)),
                          ],
                        ),
                        child: Text(
                          workoutTomorrow,
                          style: PublicVariables().normalMainColorText,
                        ),
                      ),
                      Container(
                        width: 175,
                        height: 50,
                        alignment: Alignment.center,
                        margin: PublicVariables().marginSymmetricVertical,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: PublicVariables().cardColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.5,
                                offset: Offset(1, 2)),
                          ],
                        ),
                        child: Text(
                          workoutTomorrow2,
                          style: PublicVariables().normalMainColorText,
                        ),
                      ),
                    ]),
                  ]),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            ]),
          ),
        ]),
      ),
    );
  }

  // WHEN APP LAUNCHES ADDS SOME EVENTS THAT I MANUALLY ADDED HERE //
  loadPreviousEvents() {
    mySelectedEvents = {
      "2022-11-15": [
        {
          "eventTitle": "Abs Workout",
          "eventDescp": "Lorem Lorem",
          "eventTime": "21:35"
        },
        {
          "eventTitle": "Back Workout",
          "eventDescp": "Ipsum Ipsum",
          "eventTime": "22:50"
        }
      ],
      "2022-11-16": [
        {
          "eventTitle": "Custom workout",
          "eventDescp": "Lorem ipsum",
          "eventTime": "12:15"
        }
      ],
    };
  }
}
