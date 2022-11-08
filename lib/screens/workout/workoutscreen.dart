import 'package:body_optimizer/screens/workout.dart';
import 'package:body_optimizer/screens/workout/workoutlist.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  int input;
  WorkoutScreen({super.key, required this.input, required index});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState(input);
}


class _WorkoutScreenState extends State<WorkoutScreen> {

  int input;
  _WorkoutScreenState(this.input);

  get index => input;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            PublicVariables().activeColor.withOpacity(1),
                PublicVariables().activeColor.withOpacity(0.8)
          ],
          begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight
          )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_back_ios, size: 20,
                        color: Colors.white),
                        Expanded(child: Container()),
                        const Icon(Icons.info_outline, size: 20,
                        color: Colors.white)
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(PartsCreator().partitions[index].title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  PublicVariables().activeColor,
                                  Colors.white
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
