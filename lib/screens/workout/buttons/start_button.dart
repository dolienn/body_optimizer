import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';


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
            color: isButtonPressed ? PublicVariables().mainColor.withOpacity(0.75) : const Color(0xFF453edb),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  color: PublicVariables().mainColor,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: isButtonPressed ? const Offset(3,3) : const Offset(4,4),
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