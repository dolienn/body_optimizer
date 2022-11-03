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

  Parts({
    required this.title, required this.image,
  });
}

class _WorkoutState extends State<Workout> {

  final List<Parts> partitions = [
    Parts(title: "ABS", image: "assets/images/bese.png"),
    Parts(title: "BICEPS", image: "assets/images/muscle.png"),
    Parts(title: "TRICEPS", image: "assets/images/muscle-pain.png"),
    Parts(title: "CHEST", image: "assets/images/treasure.png"),
    Parts(title: "BACK", image: "assets/images/backpack.png"),
    Parts(title: "LEGS", image: "assets/images/turkey-legs.png"),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Choose body part:",
                    style: GoogleFonts.lato(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                ),
              ],
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GridTile(
                          child: Container(
                          height: 190,
                          width: 185,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xFFE1E1E1),
                                  Color(0xFFEDEDED)
                                ]
                            ),
                            borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xff9d9898),
                                    blurRadius: 4,
                                    offset: Offset(4,8)
                                )
                              ]
                          ),
                          child: GridTile(
                            header: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Center(
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset(partitions[index].image, scale: 4.8,),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(partitions[index].title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center),
                            ),
                          ),
                            ),
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
