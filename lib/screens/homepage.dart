import 'package:body_optimizer/screens/mainpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // VARIABLES FROM OTHER SITES (for now placeholder) //
  int numOfExercises = 5;
  int numOfExercisesLeft = 0;
  String workoutToday = "Abs workout";
  String workoutTomorrow = "Custom workout 1";
  bool isDone = false;

  // PROGRESS BAR //
  double currentProgress = 0.0;
  double displayedProgress = 0.0;

  // TABLE CALENDAR //
  DateTime today = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  Map<String, List> mySelectedEvents = {};
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  String textOnDone = "";
  int itemCount = 0;

  // CALENDAR & PROGRESS BAR INITIALIZATION
  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    currentProgress =
        1.0 - (((numOfExercisesLeft * 100 / numOfExercises).round()) / 100);
    if (currentProgress == 0.99) {
      displayedProgress = currentProgress + 0.01;
    } else {
      displayedProgress = currentProgress;
    }
    changeText();
    setState(() {});
    loadPreviousEvents();
  }

  void changeText() {
    if (isDone) {
      textOnDone = "Done!";
    } else {
      textOnDone = "Not done!";
    }
  }

  // WHEN APP LAUNCHES ADDS SOME EVENTS THAT I MANUALLY ADDED HERE //
  // ---------------------------------------------------- //
  // RESEARCH ON HOW TO SAVE STUFF TO A FILE OR SOMETHING //
  loadPreviousEvents() {
    mySelectedEvents = {
      "2022-11-11": [
        {"eventDescp": "Lorem Lorem", "eventTitle": "Abs Workout"},
        {"eventDescp": "Ipsum Ipsum", "eventTitle": "Back Workout"},
      ],
      "2022-11-12": [
        {"eventDescp": "Lorem ipsum", "eventTitle": "Custom workout 1"},
      ],
    };
  }

  // LIST OF DAY EVENTS
  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)] != null) {
      return mySelectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)]!;
    } else {
      return [];
    }
  }

  // POPUP WHEN YOU CLICK "ADD EVENT" BUTTON
  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Add New Event",
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: "Description",
              ),
            ),
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
                      });
                    } else {
                      mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                        {
                          "eventTitle": titleController.text,
                          "eventDescp": descpController.text,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 15),
                    child: Text(
                      "Body optimizer",
                      style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 42,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFDEDEDE),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(1, 2.5)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
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
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: TableCalendar(
                          focusedDay: _focusedDay,
                          firstDay: DateTime(2022),
                          lastDay: DateTime(2036),
                          calendarFormat: _calendarFormat,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          rowHeight: 50,
                          daysOfWeekHeight: 25,
                          headerStyle: HeaderStyle(
                            headerMargin: const EdgeInsets.only(bottom: 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                              color: Color(0xFF30249A),
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
                              border: Border.all(color: Colors.white, width: 2),
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
                              vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            color: const Color(0xFFBABABA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${myEvents['eventTitle']}",
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit_outlined),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                          Icons.delete_forever_outlined),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${myEvents['eventDescp']}",
                                  style: GoogleFonts.lato(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      textOnDone,
                                      style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
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
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFDEDEDE),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(1, 2.5)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Today",
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              workoutToday,
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // -------- LOADING BAR ------- //
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: GFProgressBar(
                              percentage: currentProgress,
                              lineHeight: 35,
                              alignment: MainAxisAlignment.spaceBetween,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              backgroundColor: Colors.black26,
                              progressBarColor: PublicVariables().mainColor,
                              child: Center(
                                child: Text(
                                  "${((displayedProgress) * 100).round()}%",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "$numOfExercisesLeft exercises left",
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 16,
                              ),
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
                  color: const Color(0xFFDEDEDE),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        offset: Offset(1, 2.5)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    workoutTomorrow,
                                    style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
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
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, blurRadius: 5.0, offset: Offset(2.5, 2.5)),
          ],
        ),
        child: FloatingActionButton.extended(
          backgroundColor: PublicVariables().mainColor,
          onPressed: () => _showAddEventDialog(),
          label: const Text("Add event"),
        ),
      ),
    );
  }
}
