import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:body_optimizer/screens/nav_bar.dart';
import 'package:body_optimizer/constants.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/body_optimizer_square.png"),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 7.5)),
          Text("Body optimizer", style: PublicVariables().titleText),
        ],
      ),
      duration: 1750,
      centered: true,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      nextScreen: const MainPage(),
    );
  }
}
