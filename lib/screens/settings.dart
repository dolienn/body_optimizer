/*
Do zrobienia:
-Zmiana Danych Uzytkownika
-Zmiana Celu i Odpoczynku
-Wczytywanie wszystkich danych z pliku i updateowanie ich
*/
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String sexvalue = 'Male';
  var sexitems = [
    'Male',
    'Female',
    'Other',
  ];
  String restvalue = '2 min';
  var restitems = [
    '1 min',
    '2 min',
    '3 min',
    '4 min',
    '5 min',
  ];
  String goalvalue = 'keep weight';
  var goalitems = [
    'lose weight',
    'keep weight',
    'gain muscle',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Card(
              elevation: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 90,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network("https://i1.sndcdn.com/artworks-DfDLRYUqkm9IDWcy-AYXT0w-t500x500.jpg",),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Nickname",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1,
                            )
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 240, 0),
                        child: Text(
                          'Sex',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      DropdownButton(
                        elevation: 0,
                        value: sexvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: sexitems.map((String sexitems) {
                          return DropdownMenuItem(
                            value: sexitems,
                            child: Text(sexitems),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            sexvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                 SizedBox(
                   width: MediaQuery.of(context).size.width * 0.95,
                   child: Padding(
                       padding: const EdgeInsets.fromLTRB(15,0,15,10),
                       child: TextFormField(
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               labelText: "Age",
                           )
                       )
                   ),
                 ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,0,15,10),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Weight",
                            )
                        )
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,0,15,10),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Height",
                            )
                        )
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.875,
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 25),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.deepPurple.shade900,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Preferences",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 205, 0),
                        child: Text(
                          'Rest Time',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DropdownButton(
                        elevation: 0,
                        value: restvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: restitems.map((String restitems) {
                          return DropdownMenuItem(
                            value: restitems,
                            child: Text(restitems),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            restvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 133, 0),
                        child: Text(
                          'Personal goal',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      DropdownButton(
                        elevation: 0,
                        value: goalvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: goalitems.map((String goalitems) {
                          return DropdownMenuItem(
                            value: goalitems,
                            child: Text(goalitems),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            goalvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.875,
                    margin: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.deepPurple.shade900,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("About Us",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15,0,0,15),
                          child: Text(
                            'App made by:',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: const [
                        Padding(
                            padding: EdgeInsets.fromLTRB(25,0,0,15),
                            child: Text(
                              'Bartłoemiej Dzik\nKamil Ludwikowski\nDominik Bigus\nJakub Cendecki',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
      ),
    );
  }
}

// ignore: camel_case_types
