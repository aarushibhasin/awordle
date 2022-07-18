import 'package:awordle/home_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({Key? key}) : super(key: key);

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.lightBlue,
    // minimumSize: Size(300, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100  )),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Results"),
      ),
      body: Center(
        child: Container(
          color: Colors.black87,
          child: Column(
            children: [
              Center(child: const Text("You have won the Game. You are a Wordler", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40),  )),
              SizedBox(height: 50,),
              SizedBox(
                width: 200.0,
                height: 50.0,
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    while(Navigator.canPop(context)){ // Navigator.canPop return true if can pop
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Go To Home Page',),
                ),),

            ],

          )



        ),
      ),
    );
  }
}
