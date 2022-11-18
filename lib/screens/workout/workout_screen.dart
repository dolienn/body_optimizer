import 'package:body_optimizer/screens/workout/buttons/start_button.dart';
import 'package:body_optimizer/screens/workout/workout_start.dart';
import 'package:body_optimizer/screens/workout/workout_list.dart';
import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  int input;
  WorkoutScreen({super.key, required this.input, required index});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState(input);
}

int itemIndex = 0;

class _WorkoutScreenState extends State<WorkoutScreen> {
  bool isButtonPressed = false;
  void buttonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutStart(
          index: index,
          input: index,
          index2: index,
          input2: index,
        ),
      ),
    );
    setState(() {
      if (isButtonPressed == false) {
        isButtonPressed = true;
      } else if (isButtonPressed == true) {
        isButtonPressed = false;
      }
    });
  }

  int input;
  _WorkoutScreenState(this.input);

  get index => input;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: renderExercises(exercisesName, exercisesImage,
            exercisesDescription, exercisesVideo),
      ),
    );
  }

  Widget renderExercises(List exercisesName, exercisesImage,
      exercisesDescription, exercisesVideo) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const FractionalOffset(0.0, 0.3),
            colors: [
              PublicVariables().mainColor,
              PublicVariables().mainColor2,
            ],
            end: Alignment.topRight,
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
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
                  ]),
                  const SizedBox(height: 30),
                  Text(
                    PartsCreator().parts[index].title,
                    style: PublicVariables().headerWhiteText,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(children: [
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: PublicVariables().borderCircular10,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            colors: [
                              PublicVariables().mainColor,
                              PublicVariables().mainColor.withOpacity(0.75),
                              PublicVariables().mainColor2,
                            ],
                            end: Alignment.topRight),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.timer,
                              size: 20, color: Colors.white),
                          Text(
                            "60 min",
                            style: PublicVariables().normalWhiteText,
                          )
                        ],
                      ),
                    )
                  ]),
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
              child: Column(children: [
                Container(
                  margin: PublicVariables().all5,
                  padding: PublicVariables().all10,
                  child: Row(children: [
                    Text(
                      "Circuit 1: Increase in muscle mass",
                      style: PublicVariables().boldText,
                    ),
                    Expanded(child: Container()),
                  ]),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: PublicVariables().all10,
                    itemCount: exercisesName.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index2) {
                      itemIndex = index2;

                      return Container(
                        alignment: Alignment.topCenter,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < exercisesImage[index2]['exercise'].length;
                                i++)
                              PartsCreator().parts[index].title ==
                                      exercisesName[index2]['name']
                                  ? Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return SizedBox(
                                                    height: 400,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Column(children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(30.0),
                                                          child: Text(
                                                            exercisesName[
                                                                    index2]
                                                                ['exercise'][i],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 30,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(30.0),
                                                          child: Text(
                                                            exercisesDescription[
                                                                    index2]
                                                                ['exercise'][i],
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Row(children: [
                                            Padding(
                                              padding: PublicVariables().all5,
                                              child: Container(
                                                width: 55,
                                                height: 55,
                                                margin: const EdgeInsets.only(
                                                    top: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      PublicVariables()
                                                          .borderCircular10,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          exercisesImage[index2]
                                                              ['exercise'][i]),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Column(children: [
                                              Padding(
                                                padding: PublicVariables().all5,
                                                child: Text(
                                                  exercisesName[index2]
                                                      ['exercise'][i],
                                                  style: PublicVariables()
                                                      .boldText,
                                                ),
                                              ),
                                            ]),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Row(children: [
                                                Icon(Icons.loop,
                                                    size: 20,
                                                    color: PublicVariables()
                                                        .mainColor),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "3 sets",
                                                  style: PublicVariables()
                                                      .setsText,
                                                ),
                                              ]),
                                            ),
                                          ]),
                                        ),
                                        Row(children: [
                                          Container(
                                            width: 65,
                                            height: 25,
                                            padding: PublicVariables().all5,
                                            margin: const EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFEAEEFC),
                                              borderRadius: PublicVariables()
                                                  .borderCircular10,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                  color: Color(0xFF839fed),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(children: [
                                            for (int i = 0; i < 70; i++)
                                              i.isEven
                                                  ? Container(
                                                      width: 4,
                                                      height: 1,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFF839fed),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 4,
                                                      height: 1,
                                                      color: Colors.white,
                                                    ),
                                          ]),
                                        ]),
                                      ],
                                    )
                                  : const Center()
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Center(
                  child: StartButton(
                      onTap: buttonPressed, isButtonPressed: isButtonPressed),
                ),
                const SizedBox(
                  height: 25,
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
