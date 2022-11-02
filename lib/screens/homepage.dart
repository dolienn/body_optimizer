import 'package:flutter/material.dart';



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  // Index variable
  int _selectedIndex = 0;
  // Screen name variable
  String screen = "Home";
  // Number of exercises variable
  int exercises = 0;
  // Custom workout variable
  String customWorkout = "Example workout";
  // Changing app state
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    screenChanging(index);
  }
  // Word when you change your screen
  void screenChanging(int index) {
    switch(_selectedIndex){
      case 1:
        screen = "Statistics";
        break;
      case 2:
        screen = "Workout";
        break;
      case 3:
        screen = "Settings";
        break;
      default:
        screen = "Home";
        break;
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
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
            Row(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 180,
                  child: Text(
                    "$exercises exercised left",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
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
          ],
        ),
      ),
      // ------------ BOTTOM NAVIGATION BAR -------------- //
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.grey : const Color(0xFFEFEFEF),
            ),
            label: screen,
            backgroundColor: const Color(0xff5650DE),

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics_outlined,
              color: _selectedIndex == 1 ? Colors.grey : const Color(0xFFEFEFEF),
            ),
            label: screen,
            backgroundColor: const Color(0xff5650DE),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.wheelchair_pickup_outlined,
              color: _selectedIndex == 2 ? Colors.grey : const Color(0xFFEFEFEF),
            ),
            label: screen,
            backgroundColor: const Color(0xff5650DE),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _selectedIndex == 3 ? Colors.grey : const Color(0xFFEFEFEF),
            ),
            label: screen,
            backgroundColor: const Color(0xff5650DE),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
