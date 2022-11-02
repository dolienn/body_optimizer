/*
do zrobienia:
nazwa cwiczenia
możliwość dodawania ćwiczeń
usuwanie ćwiczeń
wejscie w drugi ekran w ktorym sa kategorie cwiczen
nastepnie lista cwiczen
wybieranie cwiczen i wstawiania


trudne to bardzo :(
 */
import 'package:flutter/material.dart';

class zmienne{
  var iloscCwiczen = 0; //liczba jest dodawana kiedy uzytkownik dodaje cwiczenia
  // jest uzywana do tworzenia cwiczen w liscie
}

//moze tworzyc klase o danych cwicenia ??? class cw nr 1 za pomoca jakiejs pentli a nastepnie var tytul var opis var link do zdj

class WorkoutCreator extends StatelessWidget {
  WorkoutCreator({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '_title',
      home: Scaffold(
        appBar: AppBar(title: const Text('Create custom workout'), centerTitle: true, backgroundColor: Colors.deepPurple.shade900),
        body: Column(
          children: [
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
                    OutlinedButton(onPressed: () {}, child: const Text('Cancel', style: TextStyle(color: Colors.deepPurple),)),
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
            ],*/
          ),
          ],
          //tutaj przyciski dodaj cwiczenie, odrzuc/zapisz zmiany
          //nastepnie strony do dodawania cwiczen
        ),


    )
    );
  }
}






//a