/*
Do zrobienia:
-Zmiana Danych Uzytkownika
-Zmiana Celu i Odpoczynku
-Wczytywanie wszystkich danych z pliku i updateowanie ich
*/
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:body_optimizer/widgets/widget.dart';

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
  final List<String> itemsforsex = [
    'Male',
    'Female',
    'Other',
  ];
  String? selectedValueforsex;
  final List<String> itemsforrest = [
    '1 min',
    '2 min',
    '3 min',
    '4 min',
    '5 min',
  ];
  String? selectedValueforrest;
  final List<String> itemsforgoal = [
    'lose weight',
    'keep weight',
    'gain muscle',
  ];
  String? selectedValueforgoal;
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
                      padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Select Sex',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: itemsforsex
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                              .toList(),
                          value: selectedValueforsex,
                          onChanged: (value) {
                            setState(() {
                              selectedValueforsex = value as String;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                          ),
                          iconSize: 22,
                          iconEnabledColor: Color.fromARGB(1000, 248, 105, 213),
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 40,
                          buttonWidth:  MediaQuery.of(context).size.width * 0.95,
                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.deepPurple.shade900,
                          ),
                          buttonElevation: 2,
                          itemHeight: 30,
                          itemPadding: const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth:  MediaQuery.of(context).size.width * 0.95,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.deepPurple.shade900,
                          ),
                          dropdownElevation: 8,
                          offset: const Offset(0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
                buildTextField('Enter your Age'),
                buildTextField('Enter your Weight'),
                buildTextField('Enter your Height'),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.95,
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
                      backgroundColor: Colors.deepPurple.shade900,
                      foregroundColor: Colors.yellow,
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Select Rest Time',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: itemsforrest
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                              .toList(),
                          value: selectedValueforrest,
                          onChanged: (value) {
                            setState(() {
                              selectedValueforrest = value as String;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                          ),
                          iconSize: 22,
                          iconEnabledColor: Color.fromARGB(1000, 248, 105, 213),
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 40,
                          buttonWidth:  MediaQuery.of(context).size.width * 0.95,
                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.deepPurple.shade900,
                          ),
                          buttonElevation: 2,
                          itemHeight: 25,
                          itemPadding: const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 220,
                          dropdownWidth:  MediaQuery.of(context).size.width * 0.95,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.deepPurple.shade900,
                          ),
                          dropdownElevation: 8,
                          offset: const Offset(0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Select Goal',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: itemsforgoal
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                              .toList(),
                          value: selectedValueforgoal,
                          onChanged: (value) {
                            setState(() {
                              selectedValueforgoal = value as String;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                          ),
                          iconSize: 22,
                          iconEnabledColor: Color.fromARGB(1000, 248, 105, 213),
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 40,
                          buttonWidth: MediaQuery.of(context).size.width * 0.95,
                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.deepPurple.shade900,
                          ),
                          buttonElevation: 2,
                          itemHeight: 30,
                          itemPadding: const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: MediaQuery.of(context).size.width * 0.95,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.deepPurple.shade900,
                          ),
                          dropdownElevation: 8,
                          offset: const Offset(0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.95,
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
                      backgroundColor: Colors.deepPurple.shade900,
                      foregroundColor: Colors.yellow,
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
