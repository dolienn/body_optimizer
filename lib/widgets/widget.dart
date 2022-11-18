import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';

Widget buildTextField(text) => Padding(
      padding: PublicVariables().all10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildTextField1(text)],
      ),
    );

Widget buildTextField1(text) => SizedBox(
      height: 40,
      child: TextFormField(
          decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: PublicVariables().borderCircular10,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5)),
        labelText: text,
        hintStyle: PublicVariables().normalMainColorTextSmall,
        filled: true,
        fillColor: PublicVariables().mainColor.withOpacity(0.15),
      )),
    );
