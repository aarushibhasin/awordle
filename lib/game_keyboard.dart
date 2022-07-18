import 'package:awordle/alpha_keys.dart';
import 'package:awordle/data/word.dart';
import 'package:flutter/material.dart';

class GameKeyboard extends StatelessWidget {
  Function? inputFunction;
  List<Letter> keyboardKeys;
  GameKeyboard({Key? key, required this.keyboardKeys, this.inputFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black87,
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_rowOne(), _rowTwo(), _rowThree(), _rowFour()],
      ),
    );
  }

  Widget _rowOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 9; i++)
          AlphabetKeys(
            key: UniqueKey(),
            alphabet: keyboardKeys[i],
            onKeyPressed: inputFunction,
          ),
      ],
    );
  }

  Widget _rowTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 9; i < 18; i++)
          AlphabetKeys(
            key: UniqueKey(),
            alphabet: keyboardKeys[i],
            onKeyPressed: inputFunction,
          ),
      ],
    );
  }

  Widget _rowThree() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      for (int i = 18; i < 26; i++)
        AlphabetKeys(
          key: UniqueKey(),
          alphabet: keyboardKeys[i],
          onKeyPressed: inputFunction,
        ),
    ]);
  }

  Widget _rowFour() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AlphabetKeys(
          key: UniqueKey(),
          alphabet: Letter(value: "Enter"),
          width: 120,
          onKeyPressed: inputFunction,
        ),
        AlphabetKeys(
          key: UniqueKey(),
          alphabet: Letter(value: "Delete"),
          width: 120,
          onKeyPressed: inputFunction,
        ),
      ],
    );
  }
}
