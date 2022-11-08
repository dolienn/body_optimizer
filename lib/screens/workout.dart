import 'package:body_optimizer/screens/workout/workoutlist.dart';
import 'package:body_optimizer/screens/workout/workoutscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class PublicVariables {
  var darkenColor = const Color(0xFF1c177f);
  var activeColor = const Color(0xFF5650DE);
  var lightenColor = const Color(0xFFaaa7ee);
}

class _WorkoutState extends State<Workout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          // gradient: RadialGradient(
          //   radius: 1,
          //   colors: [
          //     Color(0xABB7B7B7),
          //     Color(0xFFFFFFFF)
          //   ]
          // )
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(
                    "choose your ",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Text(
                    "Workout",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    "",
                    style: GoogleFonts.lato(fontSize: 33, fontWeight: FontWeight.bold, color: const Color(
                        0xFF232323)),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: 400,
                height: MediaQuery.of(context).size.height-206,
              child: GridView.builder(
                shrinkWrap: true,
                reverse: true,
                scrollDirection: Axis.vertical,
                itemCount: PartsCreator().partitions.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GridTile(
                          child: Expanded(
                            child: GestureDetector(
                              child: Container(
                              height: 190,
                              width: 165,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                  boxShadow:  [
                                    BoxShadow(
                                        color: const Color(0xff9d9898).withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(2,7)
                                    )
                                  ]
                              ),
                              child: GridTile(
                                header: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: Image.asset(PartsCreator().partitions[index].image, scale: 10),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 140),
                                  child: Text(PartsCreator().partitions[index].title, style: GoogleFonts.lato(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                                ),
                              ),
                                ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WorkoutScreen(index : index, input: index,),
                                  ),
                                );
                              },
                            ),
                          ) ,
                        ),
                      ],
                    ),
                  );
                  }, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 220),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

