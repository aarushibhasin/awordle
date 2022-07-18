import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({Key? key}) : super(key: key);

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return  Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MyHomePage(title: "Aaru's Wordle")));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 300,
      width: 300,
      padding: const EdgeInsets.all(20),
      // child: Text("Aaru"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome To Aaru's Wordle",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/img/wordle_icon.png', width: 200, height: 200, fit: BoxFit.fill),
        ],

        // // seconds: 3,
        // // // navigateAfterSeconds:  const MyHomePage(title: "AARU's WORDLE",),
        // // navigateAfterSeconds:  MyHomePage(title: "Aaru's Wordle",),
        // title:
        // image:  Image.asset('assets/img/wordle_icon.png',width: 500,
        //     height: 500,
        //     fit:BoxFit.fill  ),
        // backgroundColor: Colors.white,
        // loaderColor: Colors.red,
      ),
    );
  }
}
