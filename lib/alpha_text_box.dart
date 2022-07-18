import 'package:flutter/material.dart';

import 'data/word.dart';

class LetterTextBox extends StatelessWidget {
  Letter letter;
  LetterTextBox({Key? key, required this.letter, }) : super(key: key);
  final TextEditingController controller = TextEditingController();
  Color defaultColor = Colors.grey;
  Color fullMatchColor = Colors.green;
  Color partialMatchColor = Colors.yellow;
  @override
  Widget build(BuildContext context) {

    controller.text = letter.value;
    Color cellColor = defaultColor;
    if(letter.type == "FULL_MATCH") {
      cellColor = fullMatchColor;
    } else if(letter.type == "PARTIAL_MATCH")  {
      cellColor = partialMatchColor;
    }

    return SizedBox(
      width: 70,
      height: 60,
      child: TextField(
        controller: controller,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        enabled: false,
        readOnly: true,
        keyboardType: TextInputType.none,
        decoration:  InputDecoration(
            contentPadding: EdgeInsets.only( left: 25, top: 20),
            fillColor: cellColor,
            filled: true,
            border: const OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.zero,
            )),
      ),
    );
  }
}
