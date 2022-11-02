import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {

  final List partitions = [
    "abs",
    "biceps",
    "triceps",
    "chest",
    "legs",
    "back"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    "Time to ",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    "Workout",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.redAccent,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Select body part:",
                    style: GoogleFonts.lato(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    if (kDebugMode) {
                      print("Container 1 cliked!");
                    }
                  },
                child: SizedBox(
                    width: 200,
                    height: 226,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 226,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                            ),
                          ),
                ),
            ),
                InkWell(
                  onTap: (){
                    if (kDebugMode) {
                      print("Container 2 cliked!");
                    }
                  },
                  child: SizedBox(
                    width: 200,
                    height: 226,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 226,
                        width: 195,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ),
                  ),
                ),
      ],
    ),
          ],
        ),
      ),
    );
  }
}
