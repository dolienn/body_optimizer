/*import 'workoutcreator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
*/
/*
class WorkoutCreatorExercisesAbs extends StatefulWidget {
  const WorkoutCreatorExercisesAbs({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesAbs> createState() => _WorkoutCreatorExercisesAbsState();
}

class _WorkoutCreatorExercisesAbsState extends State<WorkoutCreatorExercisesAbs> {
  final List<AbsExercises> _data = AbsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select abs workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((AbsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("V-Ups");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Hollow Holds");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Medicine Ball Slam");
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesBiceps extends StatefulWidget {
  const WorkoutCreatorExercisesBiceps({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesBiceps> createState() => _WorkoutCreatorExercisesBicepsState();
}

class _WorkoutCreatorExercisesBicepsState extends State<WorkoutCreatorExercisesBiceps> {
  final List<BicepsExercises> _data = BicepsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select biceps workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((BicepsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Barbell Curl");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Cable curl");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Dumbbell Curl");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Chin-Up");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Reverse-Grip Barbell Row");
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesTriceps extends StatefulWidget {
  const WorkoutCreatorExercisesTriceps({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesTriceps> createState() => _WorkoutCreatorExercisesTricepsState();
}

class _WorkoutCreatorExercisesTricepsState extends State<WorkoutCreatorExercisesTriceps> {
  final List<TricepsExercises> _data = TricepsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select triceps workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((TricepsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Skull-crusher");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Triceps Dip");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Triceps Machine Dip");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Board Press");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Dumbbell Overhead Triceps Extension");
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesChest extends StatefulWidget {
  const WorkoutCreatorExercisesChest({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesChest> createState() => _WorkoutCreatorExercisesChestState();
}

class _WorkoutCreatorExercisesChestState extends State<WorkoutCreatorExercisesChest> {
  final List<ChestExercises> _data = ChestExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select chest workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((ChestExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Barbell Bench Press");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Incline Bench Press");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Decline Press");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Machine Chest Press");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Push-up");
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesBack extends StatefulWidget {
  const WorkoutCreatorExercisesBack({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesBack> createState() => _WorkoutCreatorExercisesBackState();
}

class _WorkoutCreatorExercisesBackState extends State<WorkoutCreatorExercisesBack> {
  final List<BackExercises> _data = BackExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select back workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((BackExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Pull-Up");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("T-Bar Row");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Seated Row");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add("Single-Arm Smith Machine Row");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add("Lat Pull-Down");
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
            ],
          )
      ),
    );
  }
}

class WorkoutCreatorExercisesLegs extends StatefulWidget {
  const WorkoutCreatorExercisesLegs({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesLegs> createState() => _WorkoutCreatorExercisesLegsState();
}

class _WorkoutCreatorExercisesLegsState extends State<WorkoutCreatorExercisesLegs> {
  final List<LegsExercises> _data = LegsExercises.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select legs workouts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5650DE),
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((LegsExercises item) {
                  return ExpansionPanelRadio(
                      value: item.id,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return CheckboxListTile(
                          title: Text(item.headerValue),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: item.value,
                          onChanged: (bool? value) {
                            setState(() {
                              item.value = value!;
                            });
                          },
                        );
                      },
                      body: ListTile(
                        subtitle: Text(item.expandedValue),
                      ));
                }).toList(),
              ),
              TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0xFF5650DE)),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Squats");
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Lunges");
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank leg lifts");
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.workoutList.add(
                          "Single-leg deadlifts");
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.workoutList.add(
                          "Stability ball knee tucks");
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add', style: TextStyle(color: Colors.white),)),
            ],
          )
      ),
    );
  }
}*/