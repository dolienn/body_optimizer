import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(text) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 7.5),
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
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(5.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(5.5)
    ),
    hintText: text,
    hintStyle: const TextStyle(color: Color(0xFF5650DE),),
    filled: true,
    fillColor: const Color(0xFF5650DE).withOpacity(0.15),
  )
);