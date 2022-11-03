/*
do zrobienia:
nazwa cwiczenia
możliwość dodawania ćwiczeń
usuwanie ćwiczeń
wejscie w drugi ekran w ktorym sa kategorie cwiczen
nastepnie lista cwiczen
wybieranie cwiczen i wstawiania


trudne to bardzo :(

yooooooooo przyda sieee
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
import 'package:flutter/scheduler.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

/*class zmienne{
  var iloscCwiczen = 0; //liczba jest dodawana kiedy uzytkownik dodaje cwiczenia
  // jest uzywana do tworzenia cwiczen w liscie
}*/

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
  WorkoutCreator({Key? key}) : super(key: key);

  @override
  State<WorkoutCreator> createState() => _WorkoutCreatorState();
}
class _WorkoutCreatorState extends State<WorkoutCreator>{
  static double Exercises = 0;
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
          MaterialPageRoute(builder: (context) => const workoutcreator_choosecategory()),
          );
        },
      ),
        ]),

        body: Column(
          children: [
            Text('$Exercises'),/*
            Form(
               key: _formKey,
               child: Column(
                 children: [
                   TextFormField(
                     //jakoś text w tym wyśrodkować
                     decoration: const InputDecoration(
                     //icon: Icon(Icons.person),
                     hintText: 'Custom workout name'
                   ),
                     onSaved: (String? value) {
                       // This optional block of code can be used to run
                       // code when the user saves the form.
                     },
                     //tutaj dać, że nazwa workoutu nie może być pusta (oraz może, że nie może być dłuższa niż x znaków
                     validator: (String? value) {
                       return (value != null && value.contains('@')) ? 'Workout name must not be empty!' : null;
                     },
                   ),
                   //ten przycisk dać na sam dół do zapisywania wszystkiego na tej stronie
                   ElevatedButton(
                     style: ButtonStyle(
                       backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple.shade900),
                     ),
                     //onPressed: zapisz cały workout
                     onPressed: () {},
                     child: const Text('Create'),
                   ),
                   //ten przycisk dać obok zamiast pod
                   //haha nie no może iPhone przycisk nie ale haha śmieszne bo na andrioidzie
                    OutlinedButton(onPressed: () => _showAlertDialog(context), child: const Text('Cancel', style: TextStyle(color: Colors.deepPurple),)),
                 ],
             ),

          //tutaj jakos form dac dla nazwy workoutu
          /*ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              //tutaj będą dodawane ćwiczenia od klienta
              //dać jakieś id aby móc dodawać tutaj container list tile?
              Container(
                width: 150.0,
                color: Colors.black12,
                child: Stack(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.recycling), //znalesc kosz
                      title: Text('Exercise'),
                      trailing: Icon(Icons.notes),
                    ),
                  ],
                ),
              ),
            ],
            //jakiś button do dodawania do listy jeśli nie chcę w appbarze
            */
          ),*/
          ],
          //tutaj przyciski dodaj cwiczenie, odrzuc/zapisz zmiany
          //nastepnie strony do dodawania cwiczen
        ),


    )
    );
  }
}
class workoutcreator_choosecategory extends StatelessWidget {
  const workoutcreator_choosecategory({super.key});

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
              Container(
                child: Text('tutaj była by zmodyfikowana strona dominika'),
              ),
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
  WorkoutCreatorExercisesAbs({super.key});

  @override
  State<WorkoutCreatorExercisesAbs> createState() => _WorkoutCreatorExercisesAbsState();
}
class _WorkoutCreatorExercisesAbsState extends State<WorkoutCreatorExercisesAbs>{
  //sprawdzanie czy checkboxy są zaznaczone
  //może zrobić jakiś plik lub klasę ExerciseData? może w app data
  bool AbsTriggerOne = false;
  bool AbsTriggerTwo = false;
  bool AbsTriggerThree = false;
  bool AbsTriggerFour = false;
  bool AbsTriggerFive = false;
  //Nazwy ćwiczeń jako zmienne aby koledzy mogli wykożystywać je w innych częściach programu (pewnie trzeba będzię gdzieś indziej dać te zmienna)
  String AbsTitleOne = "Crunches";
  String AbsTitleTwo = "Plank";
  String AbsTitleThree = "Crunches";
  String AbsTitleFour = "Crunches";
  String AbsTitleFive = "Crunches";
  //Opisy ćwiczeń -||-
  String AbsDescriptionOne = "Crunches is an abdominal endurance training exercise to strengthen, abdominal muscles. It is similar to a crunch but with fuller range of motion and  additional muscles";
  String AbsDescriptionTwo = "Focus on closing the distance between your ribs and hips by lifting your shoulders off the floor while maintaining contact between the ground and your lower back. Moving the top half up puts more emphasis on your upper abs. Start with sets of five and work towards 15.";
  //jakieś value które było by używane dla np czasu ćwiczenia
  //Ilość ćwiczeń -||-, to tuaj będzie tylko w workout creator chyba
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
                  title: Text('$AbsTitleOne'),
                  subtitle: Text('$AbsDescriptionOne'),
                  value: AbsTriggerOne,
                  onChanged: (bool? value) {
                  setState(() {
                    AbsTriggerOne = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('$AbsTitleTwo'),
                subtitle: Text('$AbsDescriptionTwo'),
                value: AbsTriggerTwo,
                onChanged: (bool? value) {
                  setState(() {
                    AbsTriggerTwo = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Animate Slowly'),
                value: AbsTriggerThree,
                onChanged: (bool? value) {
                  setState(() {
                    AbsTriggerThree = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Animate Slowly'),
                value: AbsTriggerFour,
                onChanged: (bool? value) {
                  setState(() {
                    AbsTriggerFour = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Animate Slowly'),
                value: AbsTriggerFive,
                onChanged: (bool? value) {
                  setState(() {
                    AbsTriggerFive = value!;
                  });
                },
              ),
              /*Container(
                Contener z tekstem, może się przyda
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry C')),
              ),*/
              //przycisk ten jakoś przesunąć
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple.shade900),
                  ),
                  onPressed: () {
                    if(AbsTriggerOne == true){
                      _WorkoutCreatorState.Exercises += 1;
                    }
                    if(AbsTriggerTwo == true){
                      _WorkoutCreatorState.Exercises += 1;
                    }
                    if(AbsTriggerThree == true){
                      _WorkoutCreatorState.Exercises += 1;
                    }
                    if(AbsTriggerFour == true){
                      _WorkoutCreatorState.Exercises += 1;
                    }
                    if(AbsTriggerFive == true){
                      _WorkoutCreatorState.Exercises += 1;
                    }
                    const snackBar = SnackBar(
                      content: Text('Added exercises to the workout!'),
                      );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

              }, child: const Icon(Icons.add)),
              Text('usunac pozniej: $_WorkoutCreatorState.Exercises')
            ],
          )
      ),
    );
  }

}

/*
CheckboxListTile(
      title: const Text('Animate Slowly'),
      value: timeDilation != 1.0,
      onChanged: (bool? value) {
        setState(() {
          timeDilation = value! ? 10.0 : 1.0;
        });
      },
      secondary: const Icon(Icons.hourglass_empty),
    );

// Widget class
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

// State class
class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
 */