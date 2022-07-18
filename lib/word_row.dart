import 'package:awordle/alpha_text_box.dart';
import 'package:flutter/material.dart';

import 'data/word.dart';

class WordRow extends StatelessWidget {
  late Word word;
  WordRow({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        LetterTextBox(key: UniqueKey(), letter: _getLetterFromWord(0)),
        LetterTextBox(key: UniqueKey(), letter: _getLetterFromWord(1)),
        LetterTextBox(key: UniqueKey(), letter: _getLetterFromWord(2)),
        LetterTextBox(key: UniqueKey(), letter: _getLetterFromWord(3)),
        LetterTextBox(key: UniqueKey(), letter: _getLetterFromWord(4)),
      ],
    );
  }

  Letter _getLetterFromWord(int index) {
    return word.letters.length >= index + 1 ? word.letters[index] : Letter();
  }
}
