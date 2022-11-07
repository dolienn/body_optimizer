/*
To do:

Move the row in exercise manager so that the buttons can be moved to the bottom of the page
Saving workout
Create some sort of exercise data class/list that will be available in the entire program
I think that I somehow need to get the Row out of List view but I don't know how to do it.

Useful links etc.
https://medium.com/aubergine-solutions/4-types-of-listview-in-flutter-you-should-know-30cf9e7f1739
https://mercyjemosop.medium.com/flutter-list-view-1045969b1799
void _updateMyItems(int oldIndex, int newIndex) {
  if (newIndex > oldIndex) {
    newIndex -= 1;
  }
  final String item = items.removeAt(oldIndex);
  items.insert(newIndex, item);
}


Not sure if finished:
expandedHeaderPadding
https://api.flutter.dev/flutter/material/ExpansionPanelList/ExpansionPanelList.radio.html

Create an ID for every exercise
Create a time value for exercises for workout
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWorkout{

  CustomWorkout({
    required this.name,
    required this.workout,
  });

  String name;
  var workout = [];
}

class Item {

  Item({
    required this.id,
    required this.value,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  bool value;
  String expandedValue;
  String headerValue;


//I may have to move this list somewhere higher so that it would be visible to the other pages of workout creator
  static List<Item> generateItems(int numberOfItems) {
    bool trigger = false;
    String absTitleOne = "Crunches"; // Here we'd change the "Crunches" to String absTitleOne = (variable from some exercise data page)
    String absTitleTwo = "Plank";
    String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
    String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
    return List<Item>.generate(numberOfItems, (int index) {
      if(index == 0){
        return Item(
          id: index,
          value: trigger,
          headerValue: absTitleOne,
          expandedValue: absDescriptionOne,
        );
      }
      if(index == 1){
        return Item(
          id: index,
          value: trigger,
          headerValue: absTitleTwo,
          expandedValue: absDescriptionTwo,
        );
      }
      return Item(
        id: index,
        value: trigger,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index ThThis is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index This is item number $index is is item number $index ',
      );
    });
  }
}

class WorkoutCreator extends StatefulWidget {
  const WorkoutCreator({Key? key}) : super(key: key);

  @override
  State<WorkoutCreator> createState() => _WorkoutCreatorState();
}
class _WorkoutCreatorState extends State<WorkoutCreator>{
  static String workoutName = "";
  static List<String> workoutList = [];

  static int exercises = 0;
  final _formKey = GlobalKey<FormState>();

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Discard changes?'),
        content: const Text('Leave without saving changes?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Body Optimizer',
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Create custom workout'), centerTitle: true, backgroundColor: Colors.deepPurple.shade900,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add exercise',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WorkoutCreatorChooseCategory()),
                      );
                    },
                  ),
                ]
            ),

            body: Center(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView(
                        children: <Widget>[
                          //Text('$Exercises'),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: 'Custom workout name'
                                  ),
                                  onSaved: (String? value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                SingleChildScrollView(
                                  physics: const ScrollPhysics(),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: workoutList.length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            return ListTile(
                                              leading: TextButton(
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                ),
                                                onPressed: () {
                                                  workoutList.removeAt(index);
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const WorkoutCreator()),
                                                        (Route<dynamic> route) => false,
                                                  );
                                                },
                                                child: const Icon(Icons.close),
                                              ),
                                              title: Text(workoutList[index]),
                                              trailing: TextButton(
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                                ),
                                                onPressed: () {
                                                  var placeholder = workoutList[index-1];
                                                  workoutList[index] = workoutList[index-1];
                                                  workoutList[index] = placeholder;
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => const WorkoutCreator()),
                                                        (Route<dynamic> route) => false,
                                                  );
                                                },
                                                child: const Icon(Icons.receipt),
                                              ),
                                            );
                                          }
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Expanded(
                                          child: OutlinedButton(
                                              onPressed: () => _showAlertDialog(context),
                                              child: const Text('Cancel', style: TextStyle(color: Colors.deepPurple),
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple.shade900),
                                            ),
                                            onPressed: () {
                                              const snackBar = SnackBar(
                                                content: Text('Created workout!'),
                                              );
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            },
                                            child: const Text('Create'),
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]
                    )
                )
            )
        )
    );
  }
}

class WorkoutCreatorChooseCategory extends StatelessWidget {
  const WorkoutCreatorChooseCategory({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select workout category'), centerTitle: true, backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              const Text('Here is the modified workout page'),
              SizedBox(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WorkoutCreatorExercisesAbs())
                    );},
                  child: const Text('ABS exercises'),
                ),
              ),
              SizedBox(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Gradient'),
                ),
              ),
            ],
          )
      ),
    );
  }
}



class WorkoutCreatorExercisesAbs extends StatefulWidget {
  const WorkoutCreatorExercisesAbs({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesAbs> createState() => _WorkoutCreatorExercisesAbsState();
}

class _WorkoutCreatorExercisesAbsState extends State<WorkoutCreatorExercisesAbs> {
  final List<Item> _data = Item.generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select abs workouts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionPanelList.radio(
                expandedHeaderPadding: const EdgeInsets.all(0),
                children: _data.map<ExpansionPanelRadio>((Item item) {
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if (_data[0].value == true) {
                      _WorkoutCreatorState.workoutList.add("Crunches");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[1].value == true) {
                      _WorkoutCreatorState.workoutList.add("Plank");
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[2].value == true) {
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[3].value == true) {
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if (_data[4].value == true) {
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }, child: const Text('Add', style: TextStyle(color: Colors.white),)),
              //Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}
