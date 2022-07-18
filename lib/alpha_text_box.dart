import 'package:awordle/size_utils.dart';
import 'package:flutter/material.dart';

import 'data/word.dart';

class LetterTextBox extends StatelessWidget {
  final Letter letter;
  LetterTextBox({Key? key, required this.letter, }) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final Color defaultColor = Colors.grey;
  final Color fullMatchColor = Colors.green;
  final Color partialMatchColor = Colors.yellow;
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
      width: SizeUtils.w*16,
      height: SizeUtils.h*8,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white, ),
        enabled: false,
        readOnly: true,
        keyboardType: TextInputType.none,
        decoration:  InputDecoration(
            contentPadding: const EdgeInsets.only( left: 0, top: 25),
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
