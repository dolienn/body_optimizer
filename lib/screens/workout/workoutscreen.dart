import 'package:body_optimizer/screens/mainpage.dart';
import 'package:body_optimizer/screens/workout.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}


class _WorkoutScreenState extends State<WorkoutScreen> {
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
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios, size: 20,
                        color: Colors.white),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline, size: 20,
                        color: Colors.white)
                      ],
                    ),
                    Text(PartsCreator().partitions[index].title)
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
