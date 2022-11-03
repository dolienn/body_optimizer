import 'package:body_optimizer/screens/workout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: <Widget>[
              Padding(
              padding: const EdgeInsets.only(top:16.0),
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                    icon: Icon(Icons.close, color: Colors.white, size: 40,
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
                subtitle: Text(
                  'Body',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                  ),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
