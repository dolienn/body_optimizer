/*
Do zrobienia:
-Zmiana Danych Uzytkownika
-Zmiana Celu i Odpoczynku
-Wczytywanie wszystkich danych z pliku i updateowanie ich
*/
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
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

class SettingsPage extends State<Settings> with TickerProviderStateMixin {
  late AnimationController _settingsAnimationController;
  String? nickname, sex, age, weight, height, restTime, goal;
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('assets/files/private_info.txt');
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
    _settingsAnimationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _settingsAnimationController.dispose();
    super.dispose();
  }

  final List<String> sexes = ['Male', 'Female', 'Walmart bag'],
      rests = ['1 min', '2 min', '3 min', '4 min', '5 min'],
      goals = ['lose Weight', 'keep Weight', 'gain Muscle'];
  String? sexValue, restValue, goalValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SafeArea(
          child: Text("Settings",
              style: PublicVariables().pageNameText,
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: PublicVariables().symmetricVertical,
          child: Container(
            padding: PublicVariables().symmetricVertical,
            margin: PublicVariables().all10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: PublicVariables().borderCircular20,
              boxShadow: [PublicVariables().shadow],
            ),
            child: Column(children: [
              SizedBox(
                height: 100,
                child: Padding(
                  padding: PublicVariables().all5,
                  child: Lottie.asset('assets/animations/user-icon.json'),
                ),
              ),
              Padding(
                padding: PublicVariables().symmetricVertical,
                child: Text(
                  nickname!,
                  style: PublicVariables().subheaderText,
                  textAlign: TextAlign.center,
                ),
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
                          Text(sex!, style: PublicVariables().dropdownText),
                        ]),
                        items: sexes
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: PublicVariables().dropdownText,
                                  ),
                                ))
                            .toList(),
                        value: sexValue,
                        onChanged: (value) {
                          setState(() {
                            sexValue = value.toString();
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
                          borderRadius: PublicVariables().borderCircular10,
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.white,
                        ),
                        buttonElevation: 2,
                        itemHeight: 30,
                        dropdownMaxHeight: 200,
                        dropdownWidth: MediaQuery.of(context).size.width * 0.5,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: PublicVariables().borderCircular10,
                          color: Colors.white,
                        ),
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
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: PublicVariables().mainColor,
                  borderRadius: PublicVariables().borderCircular10,
                ),
                child: TextButton(
                  onPressed: () {
                    ElegantNotification(
                      icon: Lottie.asset(
                        'assets/animations/confirm.json',
                        controller: _settingsAnimationController,
                        repeat: true,
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
                        onLoaded: (composition) {
                          _settingsAnimationController
                            ..duration = composition.duration
                            ..reset()
                            ..forward();
                        },
                      ),
                      toastDuration: const Duration(seconds: 2),
                      animationDuration: const Duration(milliseconds: 500),
                      animation: AnimationType.fromTop,
                      notificationPosition: NotificationPosition.topCenter,
                      showProgressIndicator: false,
                      title: const Text("Success"),
                      description: const Text("Information saved!"),
                    ).show(context);
                  },
                  child: Text(
                    'Save',
                    style: PublicVariables().normalWhiteText,
                  ),
                ),
              ),
            ]),
          ),
        ),
        Container(
          padding: PublicVariables().symmetricVertical,
          margin: PublicVariables().all10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: PublicVariables().borderCircular20,
            boxShadow: [PublicVariables().shadow],
          ),
          child: Column(
            children: [
              Padding(
                padding: PublicVariables().symmetricVertical,
                child: Text(
                  "Preferences",
                  style: PublicVariables().headerText,
                ),
              ),
              Padding(
                padding: PublicVariables().all5,
                child: Row(
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
                              restTime!,
                              style: PublicVariables().dropdownText,
                            ),
                          ]),
                          items: rests
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
                            goal!,
                            style: PublicVariables().dropdownText,
                          ),
                        ]),
                        items: goals
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
                        value: goalValue,
                        onChanged: (value) {
                          setState(() {
                            goalValue = value as String;
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
                        dropdownWidth: MediaQuery.of(context).size.width * 0.5,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: PublicVariables().borderCircular10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.85,
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: PublicVariables().mainColor,
                  borderRadius: PublicVariables().borderCircular10,
                ),
                child: TextButton(
                  onPressed: () {
                    ElegantNotification(
                      icon: Lottie.asset(
                        'assets/animations/confirm.json',
                        controller: _settingsAnimationController,
                        repeat: true,
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
                        onLoaded: (composition) {
                          _settingsAnimationController
                            ..duration = composition.duration
                            ..reset()
                            ..forward();
                        },
                      ),
                      toastDuration: const Duration(seconds: 2),
                      animationDuration: const Duration(milliseconds: 500),
                      animation: AnimationType.fromTop,
                      notificationPosition: NotificationPosition.topCenter,
                      showProgressIndicator: false,
                      title: const Text("Success"),
                      description: const Text("Information saved!"),
                    ).show(context);
                  },
                  child: Text(
                    'Save',
                    style: PublicVariables().normalWhiteText,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: PublicVariables().symmetricVertical,
          child: Column(children: [
            Padding(
              padding: PublicVariables().symmetricVertical,
              child: Text(
                "App made by",
                style: PublicVariables().headerText,
              ),
            ),
            Padding(
              padding: PublicVariables().all5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: PublicVariables().all5,
                    margin: PublicVariables().symmetricHorizontal,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: PublicVariables().borderCircular10,
                      boxShadow: [PublicVariables().shadow],
                    ),
                    height: 50,
                    child: Padding(
                      padding: PublicVariables().all10,
                      child: Text(
                        'Bartłomiej Dzik',
                        style: PublicVariables().normalItalizedText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: PublicVariables().all5,
                    margin: PublicVariables().symmetricHorizontal,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: PublicVariables().borderCircular10,
                      boxShadow: [PublicVariables().shadow],
                    ),
                    height: 50,
                    child: Padding(
                      padding: PublicVariables().all10,
                      child: Text(
                        'Dominik Bigus',
                        style: PublicVariables().normalItalizedText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: PublicVariables().all5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: PublicVariables().all5,
                    margin: PublicVariables().symmetricHorizontal,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: PublicVariables().borderCircular10,
                      boxShadow: [PublicVariables().shadow],
                    ),
                    height: 50,
                    child: Padding(
                      padding: PublicVariables().all10,
                      child: Text(
                        'Kamil Ludwikowski',
                        style: PublicVariables().normalItalizedText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: PublicVariables().all5,
                    margin: PublicVariables().symmetricHorizontal,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: PublicVariables().borderCircular10,
                      boxShadow: [PublicVariables().shadow],
                    ),
                    height: 50,
                    child: Padding(
                      padding: PublicVariables().all10,
                      child: Text(
                        'Jakub Cendecki',
                        style: PublicVariables().normalItalizedText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        Padding(
          padding: PublicVariables().symmetricVertical,
          child: Text(
            "© Copyright Body Optimizer ${PublicVariables().today.year}.",
            style: PublicVariables().normalText,
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
      ]),
    );
  }
}
