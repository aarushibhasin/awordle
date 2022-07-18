import 'package:awordle/data/word.dart';
import 'package:awordle/size_utils.dart';
import 'package:flutter/material.dart';

class AlphabetKeys extends StatelessWidget {
  final Letter alphabet;
  final double width;
  final Function? onKeyPressed;
   const AlphabetKeys({Key? key, required this.alphabet, this.width=8, this.onKeyPressed}) : super(key: key);

  final Color defaultColor = Colors.pinkAccent;
  final Color fullMatchColor = Colors.green;
  final Color partialMatchColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    Color cellColor = defaultColor;
    if(alphabet.type == "FULL_MATCH") {
      cellColor = fullMatchColor;
    } else if(alphabet.type == "PARTIAL_MATCH")  {
      cellColor = partialMatchColor;
    }

    return SizedBox(
      width: width*SizeUtils.w,
      height: SizeUtils.h*7,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
            primary: cellColor,
            padding: const EdgeInsets.all(0),

        ),
          onPressed : () => onKeyPressed!(alphabet.value),
        child: Center(child: Text(alphabet.value, style: const TextStyle(fontSize: 15, ), )),

      ),
    );
  }
}
