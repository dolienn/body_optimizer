import 'package:body_optimizer/screens/homepage.dart';
import 'package:body_optimizer/screens/mainpage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}