/*
Do zrobienia:
-Zmiana Danych Uzytkownika
-Zmiana Celu i Odpoczynku
-Wczytywanie wszystkich danych z pliku i updateowanie ich
*/
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
  buildAlert(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text('INFO'),
        content:
        Text('COMING SOON'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
      const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        'Setting',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    ),
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
                children: <Widget>[
                  const Padding(
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
            const Padding(
              padding: EdgeInsets.fromLTRB(15,0,15,10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Your sex',
                  border: OutlineInputBorder()
                ),
              )
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15,0,15,10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Age',
                      border: OutlineInputBorder()
                  ),
                )
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15,0,15,10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Weight',
                      border: OutlineInputBorder()
                  ),
                )
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15,0,15,10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Height',
                      border: OutlineInputBorder()
                  ),
                )
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(125, 5, 125, 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
              ),
              child: TextButton(
                onPressed: () {buildAlert();},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.blue,
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1
                  ),
                ),
              ),
            ),
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
                          letterSpacing: 1,
                        )
                    ),
                  )
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(15,0,15,10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Rest Time',
                      border: OutlineInputBorder()
                  ),
                )
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(15,0,15,10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Goal',
                      border: OutlineInputBorder()
                  ),
                )
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(125, 10, 125, 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
              ),
              child: TextButton(
                onPressed: () {buildAlert();},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.blue,
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(25,0,20,0),
                    child: Icon(
                      Icons.info,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("About Us",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          letterSpacing: 1,
                        )
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15,0,0,15),
              child: Text(
                'App Made By:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25,0,0,15),
              child: Text(
                'Bartłoemiej Dzik\nKamil Ludwikowski\nDominik Bigus\nJakub Cendecki',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
      ),
    );
  }
}

// ignore: camel_case_types
