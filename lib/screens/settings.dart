/*
Do zrobienia:
-Zmiana Danych Uzytkownika
-Zmiana Celu i Odpoczynku
-Wczytywanie wszystkich danych z pliku i updateowanie ich
*/
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:body_optimizer/widgets/widget.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';

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

  get storage => null;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String nick = "";
  String sex = "";
  String age = "";
  String weight = "";
  String height = "";
  String rest_time = "";
  String goal = "";
  String url = "";
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('textFiles/data.txt');
    final splitted = responseText.split(' ');
    setState(() {
      nick = splitted[0];
      sex = splitted[1];
      age = splitted[2];
      weight = splitted[3];
      height = splitted[4];
      rest_time = "${splitted[5]} ${splitted[6]}";
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
  final List<String> itemsforrest = [
    '1 min',
    '2 min',
    '3 min',
    '4 min',
    '5 min'
  ];
  String? selectedValueforrest;
  final List<String> itemsforgoal = [
    'lose Weight',
    'keep Weight',
    'gain Muscle'
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Lottie.asset('animation/user-icon.json'),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(nick,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1,
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    sex,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: itemsforsex
                                .map((item) => DropdownMenuItem<String>(
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
                            iconSize: 20,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 40,
                            buttonWidth:
                                MediaQuery.of(context).size.width * 0.9,
                            buttonPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: const Color(0xFF5650DE),
                            ),
                            buttonElevation: 2,
                            itemHeight: 30,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            dropdownMaxHeight: 200,
                            dropdownWidth:
                                MediaQuery.of(context).size.width * 0.9,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF5650DE),
                            ),
                            dropdownElevation: 8,
                            offset: const Offset(0, 0),
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
                        backgroundColor: const Color(0xFF5650DE),
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.deepPurple,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Preferences",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    rest_time,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: itemsforrest
                                .map((item) => DropdownMenuItem<String>(
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
                            iconSize: 20,
                            iconEnabledColor: Colors.white,
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
                              color: const Color(0xFF5650DE),
                            ),
                            buttonElevation: 2,
                            itemHeight: 25,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            dropdownMaxHeight: 220,
                            dropdownWidth:
                                MediaQuery.of(context).size.width * 0.9,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF5650DE),
                            ),
                            dropdownElevation: 8,
                            offset: const Offset(0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    goal,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: itemsforgoal
                                .map((item) => DropdownMenuItem<String>(
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
                            iconSize: 20,
                            iconEnabledColor: Colors.white,
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
                              color: const Color(0xFF5650DE),
                            ),
                            buttonElevation: 2,
                            itemHeight: 30,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            dropdownMaxHeight: 200,
                            dropdownWidth:
                                MediaQuery.of(context).size.width * 0.9,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xFF5650DE),
                            ),
                            dropdownElevation: 8,
                            offset: const Offset(0, 0),
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
                        backgroundColor: const Color(0xFF5650DE),
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.deepPurple,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Made By",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Bartłomiej Dzik',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Dominik Bigus',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Kamil Ludwikowski',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Jakub Cendecki',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
