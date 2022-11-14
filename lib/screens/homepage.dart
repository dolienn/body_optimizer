//-------------------------------------------------//
//                     TO DO                       //
// 1. setState() isn't working for direct select   //
// (you have to hot reload to see changes)         //
// 2. Adding events on "Confirm" click (date is set//
// on the selectedDay so you have to gather just   //
// time and title (:                               //
//-------------------------------------------------//

import 'package:body_optimizer/screens/mainpage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:direct_select/direct_select.dart';
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
  int numOfExercises = 13, numOfExercisesLeft = 13;

  // PROGRESS BAR //
  double currentProgress = 0.0, displayedProgress = 0.0;
  countPercentage() {
    currentProgress =
        1.0 - (((numOfExercisesLeft * 100 / numOfExercises).round()) / 100);
    if (currentProgress == 0.99) {
      displayedProgress = currentProgress + 0.01;
    } else {
      displayedProgress = currentProgress;
    }
    setState(() {});
  }

  // TABLE CALENDAR //
  final titleController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime today = DateTime.now(), _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<String, List> selectedEvents = {};
  List _listOfDayEvents(DateTime dateTime) {
    if (selectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)] != null) {
      return selectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)]!;
    }
    return [];
  }

  // DIRECT SELECT //
  int? hourIndex = 0, minuteIndex = 0;
  final hours = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23'
  ];
  final minutes = [
    '0',
    '5',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55'
  ];

  // Build hours and minutes for direct select //
  List<Widget> _buildHours() {
    return hours
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  List<Widget> _buildMinutes() {
    return minutes
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  // WHEN APP LAUNCHES ADDS SOME EVENTS THAT I MANUALLY ADDED HERE //
  loadPreviousEvents() {
    selectedEvents = {
      "2022-11-15": [
        {"eventTitle": "Abs Workout", "eventTime": "21:35"},
        {"eventTitle": "Back Workout", "eventTime": "22:50"}
      ],
      "2022-11-16": [
        {"eventTitle": "Custom workout", "eventTime": "12:15"}
      ],
    };
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    countPercentage();
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
            padding: const EdgeInsets.only(bottom: 10, left: 20),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.5,
                        offset: Offset(1, 1)),
                  ],
                ),
                child: Padding(
                  padding: PublicVariables().paddingAll,
                  child: Column(children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("This week",
                            style: PublicVariables().headerText)),
                    Container(
                      margin: PublicVariables().marginSymmetricVertical,
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: PublicVariables().mainColor, width: 0.9),
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
                            border: Border.all(color: Colors.white, width: 1.5),
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
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ..._listOfDayEvents(_selectedDay!).map(
                          (myEvents) => Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: Text(
                                    "${myEvents['eventTitle']}",
                                    style: PublicVariables().normalText,
                                  ),
                                ),
                              ]),
                              subtitle: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: Text(
                                  "${myEvents['eventTime']}",
                                  style: PublicVariables().normalText,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Plan your workout",
                                style: PublicVariables().headerText,
                              ),
                              content: SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: PublicVariables().paddingAll,
                                  child: Column(children: [
                                    TextFormField(
                                      style: PublicVariables().subheaderText,
                                      controller: titleController,
                                      decoration: InputDecoration(
                                          labelText: "Input title",
                                          labelStyle:
                                              PublicVariables().normalGreyText),
                                    ),
                                    Padding(
                                      padding: PublicVariables().paddingAll,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          DirectSelect(
                                            backgroundColor: Colors.white,
                                            selectionColor: PublicVariables()
                                                .mainColor
                                                .withOpacity(0.35),
                                            itemExtent: 40,
                                            selectedIndex: hourIndex!,
                                            onSelectedItemChanged: (index) {
                                              setState(() {
                                                hourIndex = index;
                                              });
                                            },
                                            mode: DirectSelectMode.tap,
                                            items: _buildHours(),
                                            child: MySelectionItem(
                                              isForList: false,
                                              title: hours[hourIndex!],
                                            ),
                                          ),
                                          Text(
                                            ":",
                                            style:
                                                PublicVariables().subheaderText,
                                          ),
                                          DirectSelect(
                                            backgroundColor: Colors.white,
                                            selectionColor: PublicVariables()
                                                .mainColor
                                                .withOpacity(0.35),
                                            itemExtent: 40,
                                            selectedIndex: minuteIndex!,
                                            onSelectedItemChanged: (index) {
                                              setState(() {
                                                minuteIndex = index;
                                              });
                                            },
                                            mode: DirectSelectMode.tap,
                                            items: _buildMinutes(),
                                            child: MySelectionItem(
                                              isForList: false,
                                              title: minutes[minuteIndex!],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              actions: [
                                Padding(
                                  padding: PublicVariables().paddingAll,
                                  child: TextButton(
                                    child: Text("Cancel",
                                        style: PublicVariables()
                                            .normalMainColorText),
                                    onPressed: () {
                                      titleController.text = "";
                                      hourIndex = 0;
                                      minuteIndex = 0;
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: PublicVariables().paddingAll,
                                  child: TextButton(
                                    child: Text("Confirm",
                                        style: PublicVariables()
                                            .normalMainColorText),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: PublicVariables().mainColor, width: 3),
                            ),
                            padding: PublicVariables().paddingAll,
                            child: Text(
                              "Plan workout",
                              style: PublicVariables().normalMainColorText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              Container(
                margin: PublicVariables().marginSymmetricVertical,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.5,
                        offset: Offset(1, 1)),
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: GFProgressBar(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              progressBarColor:
                                  PublicVariables().mainColor.withOpacity(0.9),
                              backgroundColor: Colors.white,
                              percentage: currentProgress,
                              lineHeight: 35,
                              child: Center(
                                child: Text(
                                  "${((displayedProgress) * 100).round()}%",
                                  style: PublicVariables().normalItalizedText,
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
                      TextButton(
                          onPressed: () {
                            if (numOfExercisesLeft < numOfExercises) {
                              numOfExercisesLeft += 1;
                              setState(() {});
                              countPercentage();
                            }
                          },
                          child: const Text("increase exercise")),
                      TextButton(
                          onPressed: () {
                            if (numOfExercisesLeft > 0) {
                              numOfExercisesLeft -= 1;
                              setState(() {});
                              countPercentage();
                            }
                          },
                          child: const Text("decrease exercise")),
                    ]),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.5,
                        offset: Offset(1, 1)),
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
                        height: 50,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.85,
                        margin: PublicVariables().marginSymmetricVertical,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.5,
                                offset: Offset(1, 2)),
                          ],
                        ),
                        child: Text(
                          workoutTomorrow,
                          style: PublicVariables().normalMainColorText,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.85,
                        margin: PublicVariables().marginSymmetricVertical,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.5,
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
}

// Direct Select Builder //
class MySelectionItem extends StatelessWidget {
  final String? title;
  final bool isForList;
  const MySelectionItem({Key? key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: 75.0,
      child: isForList
          ? Padding(
              padding: PublicVariables().paddingAll,
              child: _buildItem(context),
            )
          : Card(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                ],
              ),
            ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          title!,
          style: PublicVariables().subheaderText,
        ),
      ),
    );
  }
}
