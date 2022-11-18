import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../workout.dart';

class StartButton extends StatelessWidget{
  final onTap;
  bool isButtonPressed;

  StartButton({super.key, this.onTap, required this.isButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
            color: isButtonPressed ? PublicVariables().activeColor : Color(0xFF453edb),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  color: PublicVariables().darkenColor,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: isButtonPressed ? Offset(3,3) : Offset(4,4),
              ),
            ]),
        child: const Center(
          child: Text(
            "START",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:18
            ),
          ),
        ),
      ),
    );
  }
  
}