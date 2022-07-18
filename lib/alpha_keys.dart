import 'package:awordle/data/word.dart';
import 'package:flutter/material.dart';

class AlphabetKeys extends StatelessWidget {
  Letter alphabet;
  double width;
  Function? onKeyPressed;
   AlphabetKeys({Key? key, required this.alphabet, this.width=40, this.onKeyPressed}) : super(key: key);

  Color defaultColor = Colors.purpleAccent;
  Color fullMatchColor = Colors.green;
  Color partialMatchColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    Color cellColor = defaultColor;
    if(alphabet.type == "FULL_MATCH") {
      cellColor = fullMatchColor;
    } else if(alphabet.type == "PARTIAL_MATCH")  {
      cellColor = partialMatchColor;
    }

    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: cellColor,
            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),

        ),
          onPressed : () => onKeyPressed!(alphabet.value),
        child: Text(alphabet.value, style: TextStyle(fontSize: 15),),

      ),
    );
  }
}
