import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import 'dart:io';

//     TO DO     //
// delete events //
// from file and //
// widget        //

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // VARIABLES FROM OTHER SITES (for now placeholder) //
  String workoutToday = "Abs workout";
  List<String> workoutTomorrow = [
    "Custom Workout 1",
    "Custom Workout 2",
    "Custom Workout 3",
    "Custom Workout 4"
  ];
  int numOfExercises = 13, numOfExercisesLeft = 13;
  // FILE //
  String fileName = "savedEvents.json";
  // ANIMATION CONTROLLER //
  late AnimationController _animationController;
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
    setState(() {
      displayedProgress;
    });
  }

  // TABLE CALENDAR //
  final titleController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime today = DateTime.now(),
      _focusedDay = DateTime.now(),
      hoursAndMinutes = DateTime.now();
  DateTime? _selectedDay;
  Map<String, List> selectedEvents = {};
  List _listOfDayEvents(DateTime dateTime) {
    if (selectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)] != null) {
      return selectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)]!;
    }
    return [];
  }

  // FILE INITIALIZATION //
  Future<String> getFilePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDirectory.path;
    String filePath = '$documentsPath/$fileName';
    File(filePath).createSync();
    return filePath;
  }

  void saveFile(date, title, time) async {
    File file = File(await getFilePath());
    file.writeAsString("$date\n$title\n$time\n",
        mode: FileMode.writeOnlyAppend);
  }

  void readFile() async {
    File file = File(await getFilePath());
    List<String> fileEvents = await file.readAsLines();
    for (int i = 0; i < fileEvents.length; i += 3) {
      if (selectedEvents.containsKey(fileEvents[i])) {
        selectedEvents[fileEvents[i]]!.addAll([
          {
            "eventTitle": fileEvents[i + 1],
            "eventTime": fileEvents[i + 2],
          }
        ]);
      } else {
        selectedEvents.addAll({
          fileEvents[i]: [
            {
              "eventTitle": fileEvents[i + 1],
              "eventTime": fileEvents[i + 2],
            }
          ]
        });
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    countPercentage();
    readFile();
    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.fitness_center_outlined,
                      size: 40, color: PublicVariables().mainColor),
                  Text("Body optimizer", style: PublicVariables().bannerText),
                  Icon(Icons.fitness_center_outlined,
                      size: 40, color: PublicVariables().mainColor),
                ],
              ),
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
                child: Column(children: [
                  Container(
                    padding: PublicVariables().paddingAll,
                    child: TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime(2022),
                      lastDay: DateTime(2040),
                      calendarFormat: _calendarFormat,
                      formatAnimationCurve: Curves.easeInOut,
                      formatAnimationDuration:
                          const Duration(milliseconds: 500),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      rowHeight: 50,
                      daysOfWeekHeight: 25,
                      headerStyle: HeaderStyle(
                        headerMargin: const EdgeInsets.only(bottom: 5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        titleTextStyle: GoogleFonts.lato(
                          color: PublicVariables().mainColor,
                          fontSize: 18,
                        ),
                        formatButtonTextStyle: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                        formatButtonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: PublicVariables().mainColor,
                        ),
                        leftChevronIcon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: PublicVariables().mainColor,
                          size: 22,
                        ),
                        rightChevronIcon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: PublicVariables().mainColor,
                          size: 22,
                        ),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.black54),
                        weekendStyle: TextStyle(color: Colors.black),
                      ),
                      calendarStyle: CalendarStyle(
                        weekendTextStyle: const TextStyle(color: Colors.black),
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
                          width: MediaQuery.of(context).size.width * 0.85,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PublicVariables().mainColor,
                              width: 0.75,
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
                                    style: PublicVariables().subheaderText,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete_outlined,
                                        size: 24, color: Colors.black),
                                  ),
                                ]),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "${myEvents['eventTime']}",
                                style: PublicVariables().normalText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      titleController.text = "";
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          titlePadding: const EdgeInsets.all(5),
                          contentPadding: const EdgeInsets.all(5),
                          actionsPadding: const EdgeInsets.all(5),
                          actionsAlignment: MainAxisAlignment.end,
                          alignment: Alignment.center,
                          title: Text(
                            "Plan your workout",
                            style: PublicVariables().headerText,
                          ),
                          content: Column(children: [
                            TextFormField(
                              style: PublicVariables().subheaderText,
                              controller: titleController,
                              decoration: InputDecoration(
                                  labelText: "Input title",
                                  labelStyle: PublicVariables().normalGreyText),
                            ),
                            TimePickerSpinner(
                              time: hoursAndMinutes,
                              alignment: Alignment.center,
                              isForce2Digits: true,
                              is24HourMode: true,
                              onTimeChange: (time) {
                                setState(() {
                                  hoursAndMinutes = time;
                                });
                              },
                            ),
                          ]),
                          actions: [
                            TextButton(
                              child: Text("Cancel",
                                  style: PublicVariables().normalMainColorText),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text("Confirm",
                                  style: PublicVariables().normalMainColorText),
                              onPressed: () {
                                if (titleController.text.isEmpty) {
                                  ElegantNotification(
                                    icon: Lottie.asset(
                                      'assets/animations/error.json',
                                      controller: _animationController,
                                      repeat: true,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      onLoaded: (composition) {
                                        _animationController
                                          ..duration = composition.duration
                                          ..reset()
                                          ..forward();
                                      },
                                    ),
                                    toastDuration: const Duration(seconds: 2),
                                    animationDuration:
                                        const Duration(milliseconds: 500),
                                    animation: AnimationType.fromTop,
                                    notificationPosition:
                                        NotificationPosition.topCenter,
                                    showProgressIndicator: false,
                                    title: const Text("Error"),
                                    description: const Text("Title is empty!"),
                                  ).show(context);
                                } else {
                                  Navigator.pop(context);
                                  ElegantNotification(
                                    icon: Lottie.asset(
                                      'assets/animations/confirm.json',
                                      controller: _animationController,
                                      repeat: true,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      onLoaded: (composition) {
                                        _animationController
                                          ..duration = composition.duration
                                          ..reset()
                                          ..forward();
                                      },
                                    ),
                                    toastDuration: const Duration(seconds: 2),
                                    animationDuration:
                                        const Duration(milliseconds: 500),
                                    animation: AnimationType.fromTop,
                                    notificationPosition:
                                        NotificationPosition.topCenter,
                                    showProgressIndicator: false,
                                    title: const Text("Success"),
                                    description: const Text(
                                        "Your workout has been added!"),
                                  ).show(context);

                                  if (selectedEvents.containsKey(
                                      "${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}")) {
                                    selectedEvents[
                                            "${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}"]!
                                        .addAll([
                                      {
                                        "eventTitle": titleController.text,
                                        "eventTime":
                                            "${hoursAndMinutes.hour}:${hoursAndMinutes.minute}"
                                      }
                                    ]);
                                  } else {
                                    selectedEvents.addAll({
                                      "${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}":
                                          [
                                        {
                                          "eventTitle": titleController.text,
                                          "eventTime":
                                              "${hoursAndMinutes.hour}:${hoursAndMinutes.minute}"
                                        }
                                      ]
                                    });
                                  }
                                  setState(() {});
                                  saveFile(
                                      "${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}",
                                      titleController.text,
                                      "${hoursAndMinutes.hour}:${hoursAndMinutes.minute}");
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: PublicVariables().mainColor, width: 1.5),
                      ),
                      padding: PublicVariables().paddingAll,
                      child: Text(
                        "Plan workout",
                        style: PublicVariables().normalMainColorText,
                      ),
                    ),
                  ),
                ]),
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
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: GFProgressBar(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              progressBarColor:
                                  PublicVariables().mainColor.withOpacity(0.9),
                              backgroundColor: Colors.white,
                              linearGradient: LinearGradient(
                                colors: [
                                  PublicVariables().mainColor,
                                  PublicVariables().accentColor,
                                ],
                              ),
                              percentage: currentProgress,
                              lineHeight: 35,
                              child: Center(
                                child: Text(
                                  "${((displayedProgress) * 100).round()}%",
                                  style: PublicVariables().normalText,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (numOfExercisesLeft < numOfExercises) {
                                  numOfExercisesLeft += 1;
                                  setState(() {});
                                  countPercentage();
                                }
                              },
                              child: Text(
                                "Add 1 exercise",
                                style: PublicVariables().normalMainColorText,
                              )),
                          TextButton(
                              onPressed: () {
                                if (numOfExercisesLeft > 0) {
                                  numOfExercisesLeft -= 1;
                                  setState(() {});
                                  countPercentage();
                                }
                              },
                              child: Text(
                                "Do 1 exercise",
                                style: PublicVariables().normalMainColorText,
                              )),
                        ],
                      ),
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
                      if (workoutTomorrow.isEmpty) ...[
                        Text(
                          "No workouts planned for tomorrow!",
                          style: PublicVariables().subheaderText,
                        )
                      ] else ...[
                        for (String workout in workoutTomorrow) ...[
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
                              workout,
                              style: PublicVariables().normalMainColorText,
                            ),
                          ),
                        ],
                      ],
                    ]),
                  ]),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            ]),
          ),
        ]),
      ),
    );
  }
}
