/*
To do:
Ability to add exercises
Removing exercises
Find a better trash icon
Move the row in exercise manager so that the buttons can be moved to the bottom of the page
Saving workout
Create some sort of exercise data class/list that will be available in the entire program
Create a time value for exercises for workout
Create an ID for every exercise
Move/Modify the Elevated button on the exercise select page

Useful links etc.
https://medium.com/aubergine-solutions/4-types-of-listview-in-flutter-you-should-know-30cf9e7f1739
void _updateMyItems(int oldIndex, int newIndex) {
  if (newIndex > oldIndex) {
    newIndex -= 1;
  }
  final String item = items.removeAt(oldIndex);
  items.insert(newIndex, item);
}
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WorkoutCreator extends StatefulWidget {
  WorkoutCreator({Key? key}) : super(key: key); //Do not add a const because it'll probably break something later

  @override
  State<WorkoutCreator> createState() => _WorkoutCreatorState();
}
class _WorkoutCreatorState extends State<WorkoutCreator>{
  static double exercises = 0;
  final _formKey = GlobalKey<FormState>();

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Discard changes?'),
        content: const Text('Leave without saving changes?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
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
      title: '_title',
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
        ]),
        
        body: Center(
          child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0), //Safer without const
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
                     //icon: Icon(Icons.person),
                     hintText: 'Custom workout name'
                   ),
                     onSaved: (String? value) {
                       // This optional block of code can be used to run
                       // code when the user saves the form.@
                     },
                     //Write here that the workout name cannot be empty (and maybe that it cannot be longer than X character)
                     validator: (String? value) {
                       return (value != null && value.contains('@')) ? 'Workout name must not be empty!' : null;
                     },
                   ),


                  ],
                ),
          ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                //A whole stack is an exercise
                Stack(
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.recycling),
                      title: Text('Exercise'),
                      trailing: Icon(Icons.notes),
                    ),
                  ],
                ),
                Stack(
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.recycling),
                      title: Text('Exercise'),
                      trailing: Icon(Icons.notes),
                    ),
                  ],
                ),
              ],
            ),
              Row(
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
                  )
                ]
              )


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
                        MaterialPageRoute(builder: (context) => WorkoutCreatorExercisesAbs())
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
  WorkoutCreatorExercisesAbs({super.key}); //Safer without const

  @override
  State<WorkoutCreatorExercisesAbs> createState() => _WorkoutCreatorExercisesAbsState();
}
class _WorkoutCreatorExercisesAbsState extends State<WorkoutCreatorExercisesAbs>{
  //Checking if checkboxes are checked
  bool absTriggerOne = false;
  bool absTriggerTwo = false;
  bool absTriggerThree = false;
  bool absTriggerFour = false;
  bool absTriggerFive = false;

  String absTitleOne = "Crunches";
  String absTitleTwo = "Plank";
  String absTitleThree = "Crunches";
  String absTitleFour = "Crunches";
  String absTitleFive = "Crunches";
  //Descriptions -||-
  String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
  String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select abs workouts'), centerTitle: true, backgroundColor: Colors.deepPurple.shade900,
      ),
      body: Center(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              CheckboxListTile(
                  isThreeLine: true,
                  title: Text(absTitleOne),
                  subtitle: Text(absDescriptionOne),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: absTriggerOne,
                  onChanged: (bool? value) {
                  setState(() {
                    absTriggerOne = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(absTitleTwo),
                subtitle: Text(absDescriptionTwo),
                controlAffinity: ListTileControlAffinity.leading,
                value: absTriggerTwo,
                onChanged: (bool? value) {
                  setState(() {
                    absTriggerTwo = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Animate Slowly'),
                controlAffinity: ListTileControlAffinity.leading,
                value: absTriggerThree,
                onChanged: (bool? value) {
                  setState(() {
                    absTriggerThree = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Animate Slowly'),
                controlAffinity: ListTileControlAffinity.leading,
                value: absTriggerFour,
                onChanged: (bool? value) {
                  setState(() {
                    absTriggerFour = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Animate Slowly'),
                controlAffinity: ListTileControlAffinity.leading,
                value: absTriggerFive,
                onChanged: (bool? value) {
                  setState(() {
                    absTriggerFive = value!;
                  });
                },
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if(absTriggerOne == true){
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if(absTriggerTwo == true){
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if(absTriggerThree == true){
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if(absTriggerFour == true){
                      _WorkoutCreatorState.exercises += 1;
                    }
                    if(absTriggerFive == true){
                      _WorkoutCreatorState.exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

              }, child: const Icon(Icons.add)),
              Text('Exercise counter: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }
}
