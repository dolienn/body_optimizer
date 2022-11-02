import 'package:flutter/material.dart';

class WorkoutCreator extends StatelessWidget {
  const WorkoutCreator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '_title',
      home: Scaffold(
        appBar: AppBar(title: const Text('Create custom workout'), centerTitle: true, backgroundColor: Colors.deepPurple.shade900),
        body:  Container(

          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              //tutaj będą dodawane ćwiczenia od klienta
              Container(
                width: 150.0,
                color: Colors.black12,
                child: Stack(
                  children: <Widget>[
                    ListTile(
                      title: Text('Home'),
                      trailing: Icon(Icons.notes),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),


    )
    );
  }
}






//a