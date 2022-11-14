import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(text) => Padding(
  padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildTextField1(text)
    ],
  ),
);

Widget buildTextField1(text)=>TextFormField(
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(5.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(5.5)
    ),
    hintText: text,
    hintStyle: TextStyle(color: Colors.blue),
    filled: true,
    fillColor: Colors.blue[50],
  )
);