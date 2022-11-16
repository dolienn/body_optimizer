import 'package:body_optimizer/screens/workout/workoutlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutStart extends StatefulWidget {
  int input, input2;

  WorkoutStart({Key? key, required index, required this.input, required index2, required this.input2}) : super(key: key);

  @override
  State<WorkoutStart> createState() => _WorkoutStartState(input, input2);
}


class _WorkoutStartState extends State<WorkoutStart> {
  int input, input2;
  _WorkoutStartState(this.input, this.input2);

  get index => input;
  get index2 => input2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(exercisesVideo[index2]['exercise'][0]),

                ],
              ),
              Row(
                children: [
                  Text(exercisesName[index2]['exercise'][0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40
                    ),
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}
