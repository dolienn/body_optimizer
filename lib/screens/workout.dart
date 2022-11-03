import 'package:body_optimizer/screens/workout/workoutscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class Parts {
  final String title;
  final String image;
  final String excercises;

  Parts({
    required this.title, required this.image, required this.excercises
  });
}

class _WorkoutState extends State<Workout> {

  final List<Parts> partitions = [
    Parts(title: "ABS", image: "assets/images/abs.png", excercises: ''),
    Parts(title: "BICEPS", image: "assets/images/biceps.png", excercises: ''),
    Parts(title: "TRICEPS", image: "assets/images/triceps.png", excercises: ''),
    Parts(title: "CHEST", image: "assets/images/chest.png", excercises: ''),
    Parts(title: "BACK", image: "assets/images/back.png", excercises: ''),
    Parts(title: "LEGS", image: "assets/images/legs.png", excercises: ''),
    Parts(title: "SHOULDERS", image: "assets/images/shoulders.png", excercises: ''),
    Parts(title: "REAR", image: "assets/images/rear.png", excercises: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              Color(0xFFB7B7B7),
              Color(0xFFFFFFFF)
            ]
          )
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
                      color: Colors.black,
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
                      color: Colors.red,
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
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Choose body part:",
                    style: GoogleFonts.lato(fontSize: 33, fontWeight: FontWeight.bold, color: const Color(
                        0xFF232323)),
                  ),
                ),
              ],
            ),
            Container(
                width: 380,
                height: MediaQuery.of(context).size.height-284,
              child: GridView.builder(
                shrinkWrap: true,
                reverse: true,
                scrollDirection: Axis.vertical,
                itemCount: partitions.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GridTile(
                          child: Expanded(
                            child: GestureDetector(
                              child: Container(
                              height: 180,
                              width: 165,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0xff9d9898),
                                        blurRadius: 4,
                                        offset: Offset(2,7)
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
                                      child: Image.asset(partitions[index].image, scale: 6),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 150),
                                  child: Text(partitions[index].title, style: GoogleFonts.lato(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                                ),
                              ),
                                ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WorkoutScreen(),
                                  settings: RouteSettings()),
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

