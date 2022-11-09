import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:body_optimizer/screens/mainpage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: AnimatedSplashScreen(
        splash: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back!",
              style: PublicVariables().titleText,
            ),
          ],
        ),
        duration: 1500,
        centered: true,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        nextScreen: const MainPage(),
      ),
    );
  }
}
