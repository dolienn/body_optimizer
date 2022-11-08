import 'package:body_optimizer/screens/workout.dart';
import 'package:body_optimizer/screens/workout/workoutlist.dart';
import 'package:body_optimizer/screens/workout/workoutlist.dart';
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            PublicVariables().darkenColor,
                PublicVariables().activeColor,
          ],
          begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight
          )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                        child: const Icon(Icons.arrow_back_ios, size: 20,
                        color: Colors.white),
                        ),
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
                    const SizedBox(height: 50,),
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
                            end: Alignment.topRight)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.timer,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "60 min",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                ),
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
            Expanded(child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70)
                )
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text(
                          "Circuit 1: Increase in muscle mass",
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                        Expanded(child: Container()),
                        const SizedBox(width: 20,)
                      ],
                    ),
                  ),
                  Expanded(child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      itemCount: WorkoutListCreator().absExc.length,
                      itemBuilder: (_, int index2){

                        return GestureDetector(
                          onTap: (){
                            debugPrint(index2.toString());
                          },
                          child: Container(
                            height: 135,
                            width: 200,
                            child:
                                Column(
                                  children: [
                                    index==0 ?
                                    Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: PublicVariables().lightenColor,
                                              image: DecorationImage(image: AssetImage(WorkoutListCreator().absExc[index2].image),
                                              fit: BoxFit.cover
                                              )
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                WorkoutListCreator().absExc[index2].name,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                              ),),
                                            ),
                                            SizedBox(height: 10,),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                WorkoutListCreator().absExc[index2].instruction,
                                                style: TextStyle(
                                                  color: Colors.grey[500]
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                              const SizedBox(width: 10,),
                                              Text(
                                                "3 sets",
                                                style: GoogleFonts.lato(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                              ],
                            ): Center(),
                                    index==1 ?
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: PublicVariables().lightenColor,
                                                    image: DecorationImage(image: AssetImage(WorkoutListCreator().bicepsExc[index2].image),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    WorkoutListCreator().bicepsExc[index2].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                ),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Text(
                                                    WorkoutListCreator().bicepsExc[index2].instruction,
                                                    style: TextStyle(
                                                        color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                                  const SizedBox(width: 10,),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ): Center(),
                                    index==2 ?
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: PublicVariables().lightenColor,
                                                    image: DecorationImage(image: AssetImage(WorkoutListCreator().tricepsExc[index2].image),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    WorkoutListCreator().tricepsExc[index2].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                ),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Text(
                                                    WorkoutListCreator().tricepsExc[index2].instruction,
                                                    style: TextStyle(
                                                        color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                                  const SizedBox(width: 10,),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ): Center(),
                                    index==3 ?
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: PublicVariables().lightenColor,
                                                    image: DecorationImage(image: AssetImage(WorkoutListCreator().chestExc[index2].image),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    WorkoutListCreator().chestExc[index2].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                ),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Text(
                                                    WorkoutListCreator().chestExc[index2].instruction,
                                                    style: TextStyle(
                                                        color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                                  const SizedBox(width: 10,),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ): Center(),
                                    index==4 ?
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: PublicVariables().lightenColor,
                                                    image: DecorationImage(image: AssetImage(WorkoutListCreator().backExc[index2].image),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    WorkoutListCreator().backExc[index2].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                ),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Text(
                                                    WorkoutListCreator().backExc[index2].instruction,
                                                    style: TextStyle(
                                                        color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                                  const SizedBox(width: 10,),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ): Center(),
                                    index==5 ?
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: PublicVariables().lightenColor,
                                                    image: DecorationImage(image: AssetImage(WorkoutListCreator().legsExc[index2].image),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    WorkoutListCreator().legsExc[index2].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                ),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Text(
                                                    WorkoutListCreator().legsExc[index2].instruction,
                                                    style: TextStyle(
                                                        color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                                  const SizedBox(width: 10,),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ): Center(),
                                    index==6 ?
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: PublicVariables().lightenColor,
                                                    image: DecorationImage(image: AssetImage(WorkoutListCreator().shouldersExc[index2].image),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    WorkoutListCreator().shouldersExc[index2].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                ),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Text(
                                                    WorkoutListCreator().shouldersExc[index2].instruction,
                                                    style: TextStyle(
                                                        color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                                  const SizedBox(width: 10,),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ): Center(),
                                    index==7 ?
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: PublicVariables().lightenColor,
                                                    image: DecorationImage(image: AssetImage(WorkoutListCreator().rearExc[index2].image),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    WorkoutListCreator().rearExc[index2].name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                ),
                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Text(
                                                    WorkoutListCreator().rearExc[index2].instruction,
                                                    style: TextStyle(
                                                        color: Colors.grey[500]
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.loop, size: 20, color: PublicVariables().activeColor),
                                                  const SizedBox(width: 10,),
                                                  Text(
                                                    "3 sets",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ): Center(),
                                  ],
                                ),

                          ),
                        );
                  }))
                ],
              ),
            ))
          ],
        )
      ),
    );
  }
}
