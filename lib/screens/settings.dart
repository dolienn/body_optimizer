import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
      Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        'Setting',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    ),
    Container(
    height: 90,
    child:Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Padding(
    padding: EdgeInsets.all(7.5),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(5.0),
    child: Image.network("https://i1.sndcdn.com/artworks-DfDLRYUqkm9IDWcy-AYXT0w-t500x500.jpg",),
    ),
    ),
    Padding(
    padding: EdgeInsets.all(10),
    child: Text("Nickname",
    style: TextStyle(
    fontSize: 14,
    color: Colors.black,
    letterSpacing: 1,
    )
    ),
    )
    ],
    ),
    ),
    Padding(
    padding: EdgeInsets.fromLTRB(15,25,0,15),
    child: Text(
    'Sex: Male',
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.fromLTRB(15,0,0,15),
    child: Text(
    'Age: 32',
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.fromLTRB(15,0,0,15),
    child: Text(
    'Weight: 95kg',
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.fromLTRB(15,0,0,15),
    child: Text(
    'Height: 210cm',
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ),
    Container(
    height: 60,
    margin: EdgeInsets.fromLTRB(125, 5, 125, 25),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    boxShadow: [
    BoxShadow(
    blurRadius: 10,
    offset: Offset(1,1),
    color: Colors.purple.withOpacity(.3),
    )
    ]),
    child: TextButton(
    child: Text(
    'Edit',
    style: TextStyle(
    fontSize: 18,
    letterSpacing: 1
    ),
    ),
    onPressed: () {},
    style: TextButton.styleFrom(
    foregroundColor: Colors.blue,
    side: BorderSide(
    width: 1.0,
    color: Colors.blue,
    ),
    ),
    ),
    ),
    Container(
    height: 90,
    child:Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Padding(
    padding: EdgeInsets.fromLTRB(25,0,20,0),
    child: Icon(
    Icons.settings_sharp,
    size: 40,
    ),
    ),
    Padding(
    padding: EdgeInsets.all(10),
    child: Text("Preferences",
    style: TextStyle(
    fontSize: 14,
    color: Colors.black,
    letterSpacing: 1,
    )
    ),
    )
    ],
    ),
    ),
    Padding(
    padding: EdgeInsets.fromLTRB(15,25,0,15),
    child: Text(
    'Rest Time: 2min',
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.fromLTRB(15,0,0,15),
    child: Text(
    'Personal Goal: Lose Weight',
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ),
    Container(
    height: 60,
    margin: EdgeInsets.fromLTRB(125, 10, 125, 25),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    boxShadow: [
    BoxShadow(
    blurRadius: 10,
    offset: Offset(1,1),
    color: Colors.purple.withOpacity(.3),
    )
    ]),
    child: TextButton(
    child: Text(
    'Change',
    style: TextStyle(
    fontSize: 18,
    letterSpacing: 1
    ),
    ),//
    onPressed: () { },
    style: TextButton.styleFrom(
    foregroundColor: Colors.blue,
    side: BorderSide(
    width: 1.0,
    color: Colors.blue,
    ),
    ),
    ),
    ),
    Padding(
    padding: EdgeInsets.fromLTRB(330,30,0,0),
    child: TextButton(
    onPressed: () => showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
    title: const Text('About Us'),
    content:
    const Text(
    'App made by:\n   Bartłomiej Dzik\n   Kamil Ludwikowski\n   Dominik Bigus\n   Jakub Cendecki'
    ),

    ),
    ),
    child: Icon(Icons.info_outline, size: 40, color: Colors.black,),
    )
    ),
    ],
    ),
    );
  }
}

// ignore: camel_case_types