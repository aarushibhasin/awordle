
import 'package:awordle/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home_screen.dart';


class AppSplashScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.yellow,
      height: 500,
      width: 500,
      child: SplashScreen(

        seconds: 3,
        // navigateAfterSeconds:  const MyHomePage(title: "AARU's WORDLE",),
        navigateAfterSeconds:  MyHomePage(title: "Aaru's Wordle",),
        title:  const Text(

          "Welcome To Aaru's Wordle",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image:  Image.asset('assets/img/wordle_icon.png',width: 300,
            height: 300,
            fit:BoxFit.fill  ),
        backgroundColor: Colors.white,
        loaderColor: Colors.red,
      ),
    );
  }
}

