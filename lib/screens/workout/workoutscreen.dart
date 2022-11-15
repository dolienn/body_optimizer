import 'package:body_optimizer/screens/workout.dart';
import 'package:body_optimizer/screens/workout/workoutlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: renderTeams(exercisesName, exercisesImage, exercisesDescription, exercisesVideo),
    ),
    );
  }


Widget renderTeams(List exercisesName, exercisesImage, exercisesDescription, exercisesVideo) {
  return Scaffold(
    body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              PublicVariables().darkenColor,
              PublicVariables().activeColor,
            ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_back_ios,
                              size: 20, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        const Icon(Icons.info_outline,
                            size: 20, color: Colors.white)
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      PartsCreator().partitions[index].title,
                      style:
                      const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
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
                                    PublicVariables().lightenColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.timer,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "60 min",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Circuit 1: Increase in muscle mass",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Expanded(child: Container()),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              itemCount: exercisesName.length,
                              shrinkWrap: true,
                              itemBuilder: (_, index2) {
                                return Container(
                                  alignment: Alignment.topCenter,
                                    width: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        for(int i=0; i<exercisesImage[0]['exercise'].length; i++)
                                        PartsCreator().partitions[index].title == exercisesName[index2]['name'] ?
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 55,
                                                height: 55,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            exercisesImage[index2]['exercise'][i]),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 1.0),
                                                  child: Text(
                                                    exercisesName[index2]['exercise'][i],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop,
                                                      size: 20,
                                                      color: PublicVariables()
                                                          .activeColor),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      :const Center()],
                                    ));
                              }))
                    ],
                  ),
                ))
          ],
        )),
  );
}}
