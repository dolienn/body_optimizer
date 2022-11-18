/*
Do zrobienia:
-Zmiana Danych Uzytkownika
-Zmiana Celu i Odpoczynku
-Wczytywanie wszystkich danych z pliku i updateowanie ich
*/
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:body_optimizer/widgets/widget.dart';
import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsPage();
}

class SettingsPage extends State<Settings> {
  String nickname = "";
  String sex = "";
  String age = "";
  String weight = "";
  String height = "";
  String restTime = "";
  String goal = "";
  String url = "";
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('textFiles/data.txt');
    final splitted = responseText.split(' ');
    setState(() {
      nickname = splitted[0];
      sex = splitted[1];
      age = splitted[2];
      weight = splitted[3];
      height = splitted[4];
      restTime = "${splitted[5]} ${splitted[6]}";
      goal = "${splitted[7]} ${splitted[8]}";
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  final List<String> itemsforsex = ['Male', 'Female', 'Other'];
  String? selectedValueforsex;
  final List<String> restItems = ['1 min', '2 min', '3 min', '4 min', '5 min'];
  String? restValue;
  final List<String> itemsforgoal = [
    'lose Weight',
    'keep Weight',
    'gain Muscle'
  ];
  String? selectedValueforgoal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: PublicVariables().symmetricVertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Settings',
                textAlign: TextAlign.center,
                style: PublicVariables().headerText,
              ),
            ],
          ),
        ),
        Padding(
          padding: PublicVariables().all5,
          child: Card(
            elevation: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: PublicVariables().all5,
                        child: Lottie.asset('assets/animations/user-icon.json'),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: PublicVariables().all5,
                      padding: PublicVariables().all10,
                      child: Text(
                        nickname,
                        style: PublicVariables().subheaderText,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: PublicVariables().all5,
                      child: Text(
                        "Your sex: ",
                        style: PublicVariables().boldText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Row(children: [
                            Text(sex, style: PublicVariables().dropdownText),
                          ]),
                          items: itemsforsex
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: PublicVariables().dropdownText,
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
                          iconSize: 20,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 40,
                          buttonWidth: MediaQuery.of(context).size.width * 0.9,
                          buttonPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          buttonElevation: 2,
                          itemHeight: 30,
                          dropdownMaxHeight: 200,
                          dropdownWidth:
                              MediaQuery.of(context).size.width * 0.5,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: PublicVariables().borderCircular10,
                            color: Colors.white,
                          ),
                          dropdownElevation: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                buildTextField('Your Age: $age'),
                buildTextField('Your Weight: $weight'),
                buildTextField('Your Height: $height'),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: PublicVariables().mainColor,
                      foregroundColor: Colors.white,
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.deepPurple,
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: PublicVariables().normalWhiteText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: PublicVariables().all5,
          child: Card(
            elevation: 1,
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: PublicVariables().all5,
                          child: Text(
                            "Preferences",
                            style: PublicVariables().headerText,
                          ),
                        ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: PublicVariables().all5,
                      child: Text(
                        "Rest time: ",
                        style: PublicVariables().boldText,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Row(children: [
                            Text(
                              restTime,
                              style: PublicVariables().boldText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ]),
                          items: restItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: PublicVariables().dropdownText,
                                    ),
                                  ))
                              .toList(),
                          value: restValue,
                          onChanged: (value) {
                            setState(() {
                              restValue = value as String;
                            });
                          },
                          icon:
                              const Icon(Icons.arrow_drop_down_circle_outlined),
                          iconSize: 20,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 40,
                          buttonWidth: MediaQuery.of(context).size.width * 0.9,
                          buttonPadding: PublicVariables().symmetricHorizontal,
                          buttonDecoration: BoxDecoration(
                            borderRadius: PublicVariables().borderCircular10,
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          buttonElevation: 2,
                          itemHeight: 25,
                          dropdownMaxHeight: 220,
                          dropdownWidth:
                              MediaQuery.of(context).size.width * 0.5,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: PublicVariables().borderCircular10,
                            color: Colors.white,
                          ),
                          dropdownElevation: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: PublicVariables().all5,
                      child: Text(
                        "Your goal: ",
                        style: PublicVariables().boldText,
                      ),
                    ),
                    Container(
                      margin: PublicVariables().symmetricVertical,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Row(children: [
                            Text(
                              goal,
                              style: PublicVariables().boldText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ]),
                          items: itemsforgoal
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: PublicVariables().dropdownText,
                                  ),
                                ),
                              )
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
                          iconSize: 20,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 40,
                          buttonWidth: MediaQuery.of(context).size.width * 0.9,
                          buttonPadding: PublicVariables().symmetricHorizontal,
                          buttonDecoration: BoxDecoration(
                            borderRadius: PublicVariables().borderCircular10,
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          buttonElevation: 2,
                          itemHeight: 30,
                          dropdownWidth:
                              MediaQuery.of(context).size.width * 0.5,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: PublicVariables().borderCircular10,
                            color: Colors.white,
                          ),
                          dropdownElevation: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: PublicVariables().mainColor,
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: PublicVariables().mainColor.withOpacity(0.75),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 14, letterSpacing: 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 1,
            child: Column(children: [
              SizedBox(
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Made By",
                          style: TextStyle(fontSize: 22, color: Colors.black)),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 50,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Bartłomiej Dzik',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: 50,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Dominik Bigus',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Kamil Ludwikowski',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Jakub Cendecki',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
