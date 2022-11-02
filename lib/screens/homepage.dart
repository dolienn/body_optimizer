import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {


  // Index variable
  // Screen name variable
  String screen = "Home";
  // Number of exercises variable
  int exercises = 0;
  // Custom workout variable
  String customWorkout = "Example workout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      // ------------ MAIN PAGE CONTENT ------------ //
      body: Container(
        margin: const EdgeInsets.fromLTRB(10.0,10.0,10.0,5.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 150,
                  child: Text(
                    "This week",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: Text(
                      "Calendar placeholder",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                SizedBox(
                  width: 150,
                  child: Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 150,
                    height: 20,
                    child: ColoredBox(
                      color: Color(0xff5650DE),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 20,
                    child: ColoredBox(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 150,
                  child: Text(
                    "$exercises exercised left",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 150,
                  child: Text(
                    "Tomorrow",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      customWorkout,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        //FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
