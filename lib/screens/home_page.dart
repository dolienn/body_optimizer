import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:body_optimizer/widgets/notifications.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:body_optimizer/constants.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // VARIABLES FROM OTHER SITES (for now placeholder) //
  String workoutToday = "Abs workout";
  List<String> workoutTomorrow = ["Custom Workout 1", "Custom Workout 2"];
  int numOfExercises = 13, numOfExercisesLeft = 13;
  // FILE //
  String eventsFile = "savedEvents.sav";
  // ANIMATION CONTROLLER //
  late AnimationController _homepageAnimationController;
  // PROGRESS BAR //
  double currentProgress = 0.0;
  String displayedProgress = "0%";
  countPercentage() {
    currentProgress =
        1.0 - (((numOfExercisesLeft * 100 / numOfExercises).round()) / 100);
    if (currentProgress == 0.99) {
      displayedProgress = "Done!";
    } else {
      displayedProgress = "${((currentProgress) * 100).round()}%";
    }
    setState(() {
      displayedProgress;
    });
  }

  // TABLE CALENDAR //
  final titleController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now(), hoursAndMinutes = DateTime.now();
  String hours = "", minutes = "";
  DateTime? _selectedDay;
  Map<String, dynamic> selectedEvents = {};
  int id = 0;
  List listOfDayEvents(DateTime dateTime) {
    if (selectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)] != null) {
      return selectedEvents[DateFormat("yyyy-MM-dd").format(dateTime)]!;
    }
    return [];
  }

  // FILE INITIALIZATION //
  Future<String> getFilePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDirectory.path;
    String filePath = '$documentsPath/$eventsFile';
    File(filePath).createSync();
    return filePath;
  }

  void saveFile(date, eventId, title, time) async {
    File file = File(await getFilePath());
    file.writeAsString("$date\n$eventId\n$title\n$time\n",
        mode: FileMode.writeOnlyAppend);
  }

  void readFile() async {
    File file = File(await getFilePath());
    List<String> fileEvents = await file.readAsLines();
    for (int i = 0; i < fileEvents.length; i += 4) {
      id = int.parse(fileEvents[i + 1]);
      if (selectedEvents.containsKey(fileEvents[i])) {
        selectedEvents[fileEvents[i]]!.addAll([
          {
            "eventId": int.parse(fileEvents[i + 1]),
            "eventTitle": fileEvents[i + 2],
            "eventTime": fileEvents[i + 3],
          }
        ]);
      } else {
        selectedEvents.addAll({
          fileEvents[i]: [
            {
              "eventId": int.parse(fileEvents[i + 1]),
              "eventTitle": fileEvents[i + 2],
              "eventTime": fileEvents[i + 3],
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
    _homepageAnimationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _homepageAnimationController.dispose();
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
            margin: PublicVariables().all5,
            decoration: const BoxDecoration(color: Colors.white),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            margin: PublicVariables().symmetricHorizontal,
            child: Column(children: [
              Container(
                margin: PublicVariables().symmetricVertical,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: PublicVariables().borderCircular20,
                  boxShadow: [PublicVariables().shadow],
                ),
                child: Column(children: [
                  Container(
                    padding: PublicVariables().all10,
                    child: TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime(2022),
                      lastDay: DateTime(2042),
                      calendarFormat: _calendarFormat,
                      formatAnimationCurve: Curves.easeInOut,
                      formatAnimationDuration:
                          const Duration(milliseconds: 500),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      rowHeight: 50,
                      headerStyle: HeaderStyle(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        titleTextStyle: PublicVariables().normalMainColorText,
                        formatButtonTextStyle:
                            PublicVariables().normalWhiteText,
                        formatButtonDecoration: BoxDecoration(
                          borderRadius: PublicVariables().borderCircular20,
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
                      eventLoader: listOfDayEvents,
                    ),
                  ),
                  Column(children: [
                    ...listOfDayEvents(_selectedDay!).map(
                      (myEvents) => Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        margin: PublicVariables().symmetricVertical,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PublicVariables().mainColor,
                            width: 1,
                          ),
                          color: Colors.white,
                          borderRadius: PublicVariables().borderCircular10,
                        ),
                        child: ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${myEvents['eventTitle']}",
                                  style: PublicVariables().subheaderText,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                            "Are you sure you want to delete this planned workout?",
                                            style: PublicVariables()
                                                .subheaderText),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        PublicVariables()
                                                            .borderCircular10,
                                                    border: Border.all(
                                                        color: PublicVariables()
                                                            .mainColor,
                                                        width: 1),
                                                  ),
                                                  padding:
                                                      PublicVariables().all10,
                                                  child: Text(
                                                    "No",
                                                    style: PublicVariables()
                                                        .normalMainColorText,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        PublicVariables()
                                                            .borderCircular10,
                                                    border: Border.all(
                                                        color: PublicVariables()
                                                            .mainColor,
                                                        width: 1),
                                                  ),
                                                  padding:
                                                      PublicVariables().all10,
                                                  child: Text(
                                                    "Yes",
                                                    style: PublicVariables()
                                                        .normalMainColorText,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  // ERROR WHEN I DELETE ENTRY
                                                  // IT DOESN'T DELETE IT SOMEWHERE
                                                  // AND THE SAME NUMBER OF ID IS SHOWN
                                                  // ALSO IT NEEDS TO BE DELETED FROM FILE!
                                                  listOfDayEvents(_selectedDay!)
                                                      .removeAt(
                                                          myEvents['eventId']);
                                                  Navigator.pop(context);
                                                  Notifications().buildNotificationInfo(
                                                      _homepageAnimationController,
                                                      context,
                                                      "Workout deleted",
                                                      "Your workout has been successfully deleted!");
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.delete_outlined,
                                      size: 24, color: Colors.black),
                                ),
                              ]),
                          subtitle: Padding(
                            padding: PublicVariables().all10,
                            child: Text(
                              "${myEvents['eventTime']}",
                              style: PublicVariables().normalText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  TextButton(
                    onPressed: () {
                      titleController.text = "";
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: PublicVariables().all5,
                                child: Text(
                                  "Plan your workout",
                                  style: PublicVariables().headerText,
                                ),
                              ),
                            ],
                          ),
                          content: Padding(
                            padding: PublicVariables().all5,
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
                                padding: PublicVariables().all5,
                                child: TimePickerSpinner(
                                  itemHeight: 40,
                                  itemWidth: 30,
                                  normalTextStyle:
                                      PublicVariables().subheaderText,
                                  highlightedTextStyle:
                                      PublicVariables().headerText,
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
                              ),
                            ]),
                          ),
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
                                  Notifications().buildNotificationError(
                                      _homepageAnimationController,
                                      context,
                                      "Title is empty!");
                                } else {
                                  Navigator.pop(context);
                                  Notifications().buildNotificationSuccess(
                                      _homepageAnimationController,
                                      context,
                                      "Your workout has been added!");
                                  if (hoursAndMinutes.hour.toString().length ==
                                      1) {
                                    hours = "0${hoursAndMinutes.hour}";
                                  } else {
                                    hours = hoursAndMinutes.hour.toString();
                                  }
                                  if (hoursAndMinutes.minute
                                          .toString()
                                          .length ==
                                      1) {
                                    minutes = "0${hoursAndMinutes.minute}";
                                  } else {
                                    minutes = hoursAndMinutes.minute.toString();
                                  }
                                  if (selectedEvents.containsKey(
                                      "${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}")) {
                                    selectedEvents[
                                            "${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}"]!
                                        .addAll([
                                      {
                                        "eventId": id,
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
                                          "eventId": id,
                                          "eventTitle": titleController.text,
                                          "eventTime": "$hours:$minutes"
                                        }
                                      ]
                                    });
                                  }
                                  id++;
                                  setState(() {});
                                  saveFile(
                                      "${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}",
                                      id,
                                      titleController.text,
                                      "$hours:$minutes");
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: PublicVariables().borderCircular10,
                        border: Border.all(
                            color: PublicVariables().mainColor, width: 1),
                      ),
                      padding: PublicVariables().all10,
                      child: Text(
                        "Plan workout",
                        style: PublicVariables().normalMainColorTextSmall,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                margin: PublicVariables().symmetricVertical,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: PublicVariables().borderCircular20,
                  boxShadow: [PublicVariables().shadow],
                ),
                child: Padding(
                  padding: PublicVariables().all10,
                  child: Column(children: [
                    Row(children: [
                      Text("Today", style: PublicVariables().headerText),
                    ]),
                    Column(children: [
                      Padding(
                        padding: PublicVariables().all10,
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
                              borderRadius: PublicVariables().borderCircular20,
                              boxShadow: [PublicVariables().shadow],
                            ),
                            child: GFProgressBar(
                              padding: PublicVariables().symmetricHorizontal,
                              progressBarColor:
                                  PublicVariables().mainColor.withOpacity(0.9),
                              linearGradient: LinearGradient(colors: [
                                PublicVariables().mainColor,
                                PublicVariables().mainColor2,
                              ]),
                              backgroundColor: Colors.white,
                              percentage: currentProgress,
                              lineHeight: 35,
                              child: Center(
                                child: Text(
                                  displayedProgress,
                                  style: PublicVariables().normalText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: PublicVariables().all10,
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
                                style:
                                    PublicVariables().normalMainColorTextSmall,
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
                                style:
                                    PublicVariables().normalMainColorTextSmall,
                              )),
                        ],
                      ),
                    ]),
                  ]),
                ),
              ),
              Container(
                margin: PublicVariables().symmetricVertical,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: PublicVariables().borderCircular20,
                  boxShadow: [PublicVariables().shadow],
                ),
                child: Padding(
                  padding: PublicVariables().all10,
                  child: Column(children: [
                    Row(children: [
                      Text("Coming next", style: PublicVariables().headerText),
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
                            width: MediaQuery.of(context).size.width * 0.85,
                            alignment: Alignment.center,
                            margin: PublicVariables().symmetricVertical,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: PublicVariables().borderCircular10,
                              boxShadow: [PublicVariables().shadow],
                            ),
                            child: Text(
                              workout,
                              style: PublicVariables().normalMainColorTextSmall,
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
