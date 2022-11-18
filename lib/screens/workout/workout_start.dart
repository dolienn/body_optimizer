import 'package:body_optimizer/screens/workout/workout_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class WorkoutStart extends StatefulWidget {
  int input, input2;

  WorkoutStart(
      {Key? key,
      required index,
      required this.input,
      required index2,
      required this.input2})
      : super(key: key);

  @override
  State<WorkoutStart> createState() => _WorkoutStartState(input, input2);
}

class _WorkoutStartState extends State<WorkoutStart> {
  int input, input2;

  _WorkoutStartState(this.input, this.input2);

  get index => input;

  get index2 => input2;

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => seconds--);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          PublicVariables().mainColor,
          PublicVariables().mainColor.withOpacity(0.5),
        ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    exercisesVideo[index2]['exercise'][0],
                    scale: 1.42,
                  ),
                ],
              ),
            ),
            Padding(
              padding: PublicVariables().all10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    exercisesName[index2]['exercise'][0],
                    style: GoogleFonts.lato(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
