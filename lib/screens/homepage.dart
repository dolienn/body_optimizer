import 'package:body_optimizer/screens/mainpage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:direct_select/direct_select.dart';
import 'package:body_optimizer/build_direct.dart';
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
  String workoutToday = "Abs workout", workoutTomorrow = "Custom workout 1";
  int numOfExercises = 5, numOfExercisesLeft = 0;
  bool isDone = false;

  // EVENT DIALOG VARIABLES
  int? selectedHour = 0, selectedMinute = 0;
  final hours = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23"
  ];
  final minutes = [
    "00",
    "05",
    "10",
    "15",
    "20",
    "25",
    "30",
    "35",
    "40",
    "45",
    "50",
    "55"
  ];
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

  // TABLE CALENDAR //
  final titleController = TextEditingController(),
      descpController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  Map<String, List> mySelectedEvents = {};
  DateTime today = DateTime.now(), _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  String textOnDone = "";

  void changeText() {
    if (isDone) {
      textOnDone = "Done!";
    } else {
      textOnDone = "Not done!";
    }
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)] != null) {
      return mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)]!;
    }
    return [];
  }

  // PROGRESS BAR //
  double currentProgress = 0.0, displayedProgress = 0.0;

  // CALENDAR & PROGRESS BAR INITIALIZATION
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
    changeText();
    loadPreviousEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30, bottom: 40, left: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    PublicVariables().mainColor.withOpacity(0.9),
                    Colors.white,
                  ],
                  stops: const [0.3, 0.95],
                ),
                color: PublicVariables().cardColor,
              ),
              child: Row(
                children: [
                  Text("Body optimizer", style: PublicVariables().bannerText),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 7.5),
              child: Column(
                children: [
                  Container(
                    margin: PublicVariables().marginSymmetricVertical,
                    decoration: BoxDecoration(
                      color: PublicVariables().cardColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                            offset: Offset(1, 2.5)),
                      ],
                    ),
                    child: Padding(
                      padding: PublicVariables().paddingAll,
                      child: Column(
                        children: [
                          Row(children: [
                            Text("This week",
                                style: PublicVariables().headerText),
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
                                  color: PublicVariables()
                                      .mainColor
                                      .withOpacity(0.85),
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
                                  border: Border.all(
                                      color: Colors.white, width: 1.5),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${myEvents['eventTitle']}",
                                      style: PublicVariables().normalText,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit_outlined),
                                          color: Colors.black,
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                              Icons.delete_forever_outlined),
                                          color: Colors.black,
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${myEvents['eventDescp']}",
                                          style:
                                              PublicVariables().normalGreyText,
                                        ),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(right: 15)),
                                        Text(
                                          "${myEvents['eventTime']}",
                                          style: PublicVariables().normalText,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          textOnDone,
                                          style: PublicVariables().normalText,
                                        ),
                                        Transform.scale(
                                          scale: 1.25,
                                          child: Checkbox(
                                            checkColor: Colors.white,
                                            shape: const CircleBorder(),
                                            value: isDone,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isDone = value!;
                                              });
                                              changeText();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                            blurRadius: 5.0,
                            offset: Offset(1, 2.5)),
                      ],
                    ),
                    child: Padding(
                      padding: PublicVariables().paddingAll,
                      child: Column(
                        children: [
                          Row(children: [
                            Text("Today", style: PublicVariables().headerText),
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  workoutToday,
                                  style: PublicVariables().subheaderText,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: GFProgressBar(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 7.5),
                                  progressBarColor: PublicVariables()
                                      .mainColor
                                      .withOpacity(0.9),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "$numOfExercisesLeft exercises left",
                                  style: PublicVariables().normalText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                            blurRadius: 5.0,
                            offset: Offset(1, 2.5)),
                      ],
                    ),
                    child: Padding(
                      padding: PublicVariables().paddingAll,
                      child: Column(
                        children: [
                          Row(children: [
                            Text("Tomorrow",
                                style: PublicVariables().headerText),
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    PublicVariables().marginSymmetricVertical,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Padding(
                                  padding: PublicVariables().paddingAll,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        workoutTomorrow,
                                        style: PublicVariables().normalText,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              offset: Offset(2.5, 2.5),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          backgroundColor: PublicVariables().mainColor,
          onPressed: () => _showAddEventDialog(),
          label: Text("Add workout", style: PublicVariables().normalWhiteText),
        ),
      ),
    );
  }

  // WHEN APP LAUNCHES ADDS SOME EVENTS THAT I MANUALLY ADDED HERE //
  // ---------------------------------------------------- //
  // RESEARCH ON HOW TO SAVE STUFF TO A FILE OR SOMETHING //
  loadPreviousEvents() {
    mySelectedEvents = {
      "2022-11-11": [
        {
          "eventDescp": "Lorem Lorem",
          "eventTitle": "Abs Workout",
          "eventTime": "21:35"
        },
        {
          "eventDescp": "Ipsum Ipsum",
          "eventTitle": "Back Workout",
          "eventTime": "22:50"
        },
      ],
      "2022-11-12": [
        {
          "eventDescp": "Lorem ipsum",
          "eventTitle": "Custom workout 1",
          "eventTime": "12:15"
        },
      ],
    };
  }

  _buildDirectSelect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DirectSelect(
          itemExtent: 50.0,
          items: _buildHours(),
          selectedIndex: selectedHour!,
          mode: DirectSelectMode.tap,
          selectionColor: PublicVariables().mainColor.withOpacity(0.25),
          child: MySelectionItem(isForList: false, title: hours[selectedHour!]),
          onSelectedItemChanged: (index) {
            setState(() {
              selectedHour = index;
            });
            _buildHours();
          },
        ),
        DirectSelect(
          itemExtent: 50.0,
          items: _buildMinutes(),
          selectedIndex: selectedMinute!,
          mode: DirectSelectMode.tap,
          selectionColor: PublicVariables().mainColor.withOpacity(0.25),
          child: MySelectionItem(
              isForList: false, title: minutes[selectedMinute!]),
          onSelectedItemChanged: (index) {
            setState(() {
              selectedMinute = index;
            });
            _buildMinutes();
          },
        ),
      ],
    );
  }

  // POPUP WHEN YOU CLICK "ADD EVENT" BUTTON
  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.95),
        title: const Text("Add New Workout", textAlign: TextAlign.center),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            Padding(
              padding: PublicVariables().paddingAll,
              child: Text(
                "Tap to select your workout time:",
                style: PublicVariables().normalGreyText,
              ),
            ),
            _buildDirectSelect(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
              child: const Text("Add Event"),
              onPressed: () {
                if (titleController.text.isEmpty ||
                    descpController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Required title and description"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                } else {
                  setState(() {
                    if (mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                        null) {
                      mySelectedEvents[
                              DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                          ?.add({
                        "eventTitle": titleController.text,
                        "eventDescp": descpController.text,
                        "eventTime":
                            "${hours[selectedHour!]}:${minutes[selectedMinute!]}",
                      });
                    } else {
                      mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                        {
                          "eventTitle": titleController.text,
                          "eventDescp": descpController.text,
                          "eventTime":
                              "${hours[selectedHour!]}:${minutes[selectedMinute!]}",
                        }
                      ];
                    }
                    Navigator.pop(context);
                    return;
                  });
                }
              }),
        ],
      ),
    );
  }
}
