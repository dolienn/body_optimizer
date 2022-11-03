/*
do zrobienia:
możliwość dodawania ćwiczeń
usuwanie ćwiczeń
wybieranie cwiczen i wstawiania

przydatne linki itp
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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//moze tworzyc klase o danych cwicenia ??? class cw nr 1 za pomoca jakiejs pentli a nastepnie var tytul var opis var link do zdj
//ta klasa tutaj nie wiem czy bedzie wogule uzywana ale jest bo tak :D
class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                text: label,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint('Label has been tapped.');
                  },
              ),
            ),
          ),
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
        ],
      ),
    );
  }
}

class WorkoutCreator extends StatefulWidget {
  WorkoutCreator({Key? key}) : super(key: key); //nie dawać const teraz bo później chyba popsuje

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
        title: const Text('Disgard changes?'),
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
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0), //chyba bezpieczniej bez const
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
                     //tutaj dać, że nazwa workoutu nie może być pusta (oraz może, że nie może być dłuższa niż x znaków
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
                //tutaj będą dodawane ćwiczenia od klienta
                //dać jakieś id aby móc dodawać tutaj container list tile?
                Stack(
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.recycling), //znalesc kosz
                      title: Text('Exercise'),
                      trailing: Icon(Icons.notes),
                    ),
                  ],
                ),
                //cały stack jako ćwiczenie
                Stack(
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.recycling), //znalesc kosz
                      title: Text('Exercise'),
                      trailing: Icon(Icons.notes),
                    ),
                  ],
                ),
              ],
              //jakiś button do dodawania do listy jeśli nie chcę w appbarze

            ),
              //tutaj znajduję się przycisk "Add exercise" jaki był w designie, uważam, że w app bardze przycisk + jest dobrą alternatywą
              //ale zawsze można dać tutaj jakoś padding i mieć przycisk jak w designie :)
              /*Row(
                  children: <Widget>[
              ElevatedButton(
                  onPressed: (){},
                  child: Text('Add exercise', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple.shade900),
                  ),
              ),
                  ]
              ),*/
              //jakoś trzeba przesunąć ten row ale jest w list view
              Row(
                //crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //ten przycisk dać obok zamiast pod
                  //haha nie no może iPhone przycisk nie ale haha śmieszne bo na andrioidzie
                  Expanded(
                    //width: 185,
                  child: OutlinedButton(
                      onPressed: () => _showAlertDialog(context),
                      child: const Text('Cancel', style: TextStyle(color: Colors.deepPurple),
                      )
                  ),
                  ),
                  Expanded(
                    //width: 185,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple.shade900),
                    ),
                    //onPressed: zapisz cały workout
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
              const Text('tutaj była by zmodyfikowana strona dominika'),
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
  WorkoutCreatorExercisesAbs({super.key}); //bezpieczniej bez const

  @override
  State<WorkoutCreatorExercisesAbs> createState() => _WorkoutCreatorExercisesAbsState();
}
class _WorkoutCreatorExercisesAbsState extends State<WorkoutCreatorExercisesAbs>{
  //sprawdzanie czy checkboxy są zaznaczone
  bool absTriggerOne = false;
  bool absTriggerTwo = false;
  bool absTriggerThree = false;
  bool absTriggerFour = false;
  bool absTriggerFive = false;
  //Nazwy ćwiczeń jako zmienne aby koledzy mogli wykożystywać je w innych częściach programu (pewnie trzeba będzię gdzieś indziej dać te zmienna)
  //może zrobić jakiś plik lub klasę ExerciseData? może w app data
  String absTitleOne = "Crunches";
  String absTitleTwo = "Plank";
  String absTitleThree = "Crunches";
  String absTitleFour = "Crunches";
  String absTitleFive = "Crunches";
  //Opisy ćwiczeń -||-
  String absDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
  String absDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
  //jakieś value które było by używane dla np czasu ćwiczenia
  //Ilość ćwiczeń -||-, to tuaj będzie tylko w workout creator chyba
  //trzeba dać ćwiczenom/ćwiczenią jakieś ID
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
              //przycisk ten jakoś przesunąć
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
              Text('usunac pozniej: ${_WorkoutCreatorState.exercises}')
            ],
          )
      ),
    );
  }

}
