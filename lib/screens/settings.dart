import 'package:body_optimizer/widgets/notifications.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:body_optimizer/widgets/text_fields.dart';
import 'package:path_provider/path_provider.dart';
import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:io';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsPage();
}

class SettingsPage extends State<Settings> with TickerProviderStateMixin {
  String profileFile = "savedInfo.sav";
  late AnimationController _settingsAnimationController;
  final nickController = TextEditingController(),
      ageController = TextEditingController(),
      weightController = TextEditingController(),
      heightController = TextEditingController();
  String nickname = "",
      sex = "",
      age = "",
      weight = "",
      height = "",
      restTime = "",
      goal = "";
  String? sexValue, restValue, goalValue;
  final List<String> sexes = ['Male', 'Female', 'Walmart bag'],
      rests = ['1 min', '2 min', '3 min', '4 min', '5 min'],
      goals = ['Lose weight', 'Keep weight', 'Gain muscle'];
  bool editInfo = false;

  Future<String> getFilePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDirectory.path;
    String filePath = '$documentsPath/$profileFile';
    File(filePath).createSync();
    return filePath;
  }

  void saveFile(nickname, sex, age, weight, height, restTime, goal) async {
    File file = File(await getFilePath());
    file.writeAsString(
        "$nickname\n$sex\n$age\n$weight\n$height\n$restTime\n$goal\n",
        mode: FileMode.write);
  }

  void readFile() async {
    File file = File(await getFilePath());
    List<String> fileInfo = await file.readAsLines();
    if (fileInfo.isNotEmpty) {
      nickname = fileInfo[0];
      sex = fileInfo[1];
      age = fileInfo[2];
      weight = fileInfo[3];
      height = fileInfo[4];
      restTime = fileInfo[5];
      goal = fileInfo[6];
    } else {
      nickname = 'nickname';
      sex = sexes[0];
      age = '18';
      weight = '70';
      height = '180';
      restTime = rests[0];
      goal = goals[0];
    }
    setState(() {});
  }

  @override
  void initState() {
    readFile();
    super.initState();
    _settingsAnimationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _settingsAnimationController.dispose();
    super.dispose();
  }

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
              if (editInfo == true) ...[
                Padding(
                  padding: PublicVariables().all5,
                  child: Text(
                    "Edit mode",
                    style: PublicVariables().headerText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: PublicVariables().all5,
                  child: TextFormField(
                    style: PublicVariables().subheaderText,
                    controller: nickController,
                    decoration: InputDecoration(
                        labelText: "Enter nickname",
                        labelStyle: PublicVariables().normalGreyText),
                  ),
                ),
                Padding(
                  padding: PublicVariables().all5,
                  child: TextFormField(
                    style: PublicVariables().subheaderText,
                    controller: ageController,
                    decoration: InputDecoration(
                        labelText: "Enter your age",
                        labelStyle: PublicVariables().normalGreyText),
                  ),
                ),
                Padding(
                  padding: PublicVariables().all5,
                  child: TextFormField(
                    style: PublicVariables().subheaderText,
                    controller: weightController,
                    decoration: InputDecoration(
                        labelText: "Enter your weight (in kilos)",
                        labelStyle: PublicVariables().normalGreyText),
                  ),
                ),
                Padding(
                  padding: PublicVariables().all5,
                  child: TextFormField(
                    style: PublicVariables().subheaderText,
                    controller: heightController,
                    decoration: InputDecoration(
                        labelText: "Enter your height (in cm)",
                        labelStyle: PublicVariables().normalGreyText),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      margin: PublicVariables().all5,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                        color: PublicVariables().mainColor,
                        borderRadius: PublicVariables().borderCircular10,
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            editInfo = false;
                          });
                        },
                        child: Text("Cancel",
                            style: PublicVariables().normalWhiteText),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.40,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        color: PublicVariables().mainColor,
                        borderRadius: PublicVariables().borderCircular10,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (editInfo == true) {
                            if (nickController.text.isEmpty ||
                                ageController.text.isEmpty ||
                                weightController.text.isEmpty ||
                                heightController.text.isEmpty) {
                              Notifications().buildNotificationError(
                                  _settingsAnimationController,
                                  context,
                                  "1 or more fields are empty!");
                            } else {
                              setState(() {
                                editInfo = false;
                                nickname = nickController.text;
                                age = ageController.text;
                                weight = weightController.text;
                                height = heightController.text;
                                saveFile(nickname, sex, age, weight, height,
                                    restTime, goal);
                              });
                              Notifications().buildNotificationSuccess(
                                  _settingsAnimationController,
                                  context,
                                  "Information saved!");
                            }
                          }
                        },
                        child: Text(
                          'Save',
                          style: PublicVariables().normalWhiteText,
                        ),
                      ),
                    ),
                  ],
                ),
              ] else ...[
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
                    nickname,
                    style: PublicVariables().subheaderText,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Sex: ",
                        style: PublicVariables().boldText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(sex,
                                    style: PublicVariables().dropdownText),
                              ),
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
                                sex = value.toString();
                                saveFile(nickname, sex, age, weight, height,
                                    restTime, goal);
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle_outlined,
                            ),
                            iconSize: 20,
                            iconEnabledColor: Colors.black,
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 40,
                            buttonWidth:
                                MediaQuery.of(context).size.width * 0.9,
                            buttonPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            buttonDecoration: BoxDecoration(
                              borderRadius: PublicVariables().borderCircular10,
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white,
                            ),
                            itemHeight: 35,
                            dropdownMaxHeight: 220,
                            dropdownWidth:
                                MediaQuery.of(context).size.width * 0.45,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: PublicVariables().borderCircular10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TextFields().buildTextInfo('Age: ', '$age yo', context),
                TextFields().buildTextInfo('Weight: ', '$weight kg', context),
                TextFields().buildTextInfo('Height: ', '$height cm', context),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: PublicVariables().mainColor,
                    borderRadius: PublicVariables().borderCircular10,
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        editInfo = true;
                      });
                    },
                    child:
                        Text("Edit", style: PublicVariables().normalWhiteText),
                  ),
                ),
              ],
            ]),
          ),
        ),
        Container(
          padding: PublicVariables().symmetricHorizontal,
          margin: PublicVariables().all10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: PublicVariables().borderCircular20,
            boxShadow: [PublicVariables().shadow],
          ),
          child: Column(children: [
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
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              restTime,
                              style: PublicVariables().dropdownText,
                            ),
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
                            restTime = value!;
                            saveFile(nickname, sex, age, weight, height,
                                restTime, goal);
                          });
                        },
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(Icons.arrow_drop_down_circle_outlined),
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
                        itemHeight: 35,
                        dropdownMaxHeight: 220,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  margin: PublicVariables().symmetricHorizontal,
                  child: Text(
                    "Goal:",
                    style: PublicVariables().boldText,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
                Container(
                  margin: PublicVariables().all10,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            goal,
                            style: PublicVariables().dropdownText,
                          ),
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
                          goal = value!;
                          saveFile(nickname, sex, age, weight, height, restTime,
                              goal);
                        });
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                        ),
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
                      itemHeight: 35,
                      dropdownMaxHeight: 220,
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
          ]),
        ),
        Padding(
          padding: PublicVariables().symmetricVertical,
          child: Column(children: [
            Padding(
              padding: PublicVariables().symmetricVertical,
              child: Text(
                "App made by:",
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
        const Padding(padding: EdgeInsets.symmetric(vertical: 7.5)),
        Padding(
          padding: PublicVariables().symmetricVertical,
          child: Text(
            "© Copyright Body Optimizer ${PublicVariables().today.year}",
            style: PublicVariables().normalText,
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 7.5)),
      ]),
    );
  }
}
