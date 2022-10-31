import 'package:body_optimizer/screens/homepage.dart';
import 'package:body_optimizer/screens/settings.dart';
import 'package:body_optimizer/screens/workout.dart';
import 'package:body_optimizer/screens/workoutcreator.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [const MyHomePage(), const Workout(), const WorkoutCreator(), const Settings()];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade900,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Workout", icon: Icon(Icons.fitness_center)),
          BottomNavigationBarItem(
              label: "Workout Creator", icon: Icon(Icons.create)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings))
        ],
      ),
    );
  }
}
