import 'package:body_optimizer/screens/workout.dart';
import 'package:body_optimizer/screens/workout/workoutlist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext index) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            children: <Widget>[
              Padding(
              padding: const EdgeInsets.only(top:16.0),
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                    icon: const Icon(Icons.close, color: Colors.white, size: 40,
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
                subtitle: const Text(
                  'Chest',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                  ),
                ),
                trailing: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.white30,
                    ),
                    SizedBox(
                        width: 5,
                    ),
                    Text(
                      "60 mins",
                      style: TextStyle(
                        color: Colors.white30,
                      ),
                    )
                        ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.shutter_speed,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Easy",
                          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
        for (int index = 0; index < PartsCreator().partitions.length; index++)
        Column(
          children: [
            PartsCreator().partitions[index].title == "ABS" ?
                Column(
          children: [
            for (int i = 0; i < abs.length; i++)
              Column(
                children: <Widget>[
                  for (int j = 0; j < abs[i].length; j++)
                    ListTile(
                      leading: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFF5B4D9D),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          abs[i][j].image,
                          width: 45,
                          height: 45,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        abs[i][j].name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        abs[i][j].instruction,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
          ],
        ):const Center(),
            PartsCreator().partitions[index].title == "BICEPS" ?
                Column(
                    children: [
                      for (int i = 0; i < chest.length; i++)
                      Column(
                        children: <Widget>[
                          for (int j = 0; j < chest[i].length; j++)
                            ListTile(
                              leading: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xFF5B4D9D),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Image.asset(
                                  chest[i][j].image,
                                  width: 45,
                                  height: 45,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                chest[i][j].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                chest[i][j].instruction,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ):const Center(),
            PartsCreator().partitions[index].title == "TRICEPS" ?
                Column(
                children: [
                  for (int i = 0; i < back.length; i++)
                    Column(
                      children: <Widget>[
                        for (int j = 0; j < back[i].length; j++)
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Color(0xFF5B4D9D),
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                back[i][j].image,
                                width: 45,
                                height: 45,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              back[i][j].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              back[i][j].instruction,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                ],
              ):const Center(),
    ],
        ),
],
          ),
        ),
      ),
    );
  }
}
