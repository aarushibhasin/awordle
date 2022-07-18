import 'package:awordle/alpha_keys.dart';
import 'package:awordle/data/word.dart';
import 'package:awordle/size_utils.dart';
import 'package:flutter/material.dart';

class GameKeyboard extends StatelessWidget {
  Function? inputFunction;
  List<Letter> keyboardKeys;
  GameKeyboard({Key? key, required this.keyboardKeys, this.inputFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      padding: const EdgeInsets.all(5),
      height: SizeUtils.h*30  ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch  ,
        children: [_rowOne(), _rowTwo(), _rowThree()
          // _rowFour()
        ],
      ),
    );
  }

  Widget _rowOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 10; i++)
          AlphabetKeys(
            key: ObjectKey(keyboardKeys[i]),
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
        const SizedBox(width: 10,),
        for (int i = 10; i < 19; i++)
          AlphabetKeys(
            key: ObjectKey(keyboardKeys[i]),
            alphabet: keyboardKeys[i],
            onKeyPressed: inputFunction,
          ),
        const SizedBox(width: 10,)
      ],
    );
  }

  final Letter enterKey = Letter(value: "Enter");
  final Letter delKey = Letter(value: "Del");
  Widget _rowThree() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      AlphabetKeys(
        key: ObjectKey(enterKey),
        alphabet: enterKey,
        width: 15 ,
        onKeyPressed: inputFunction,
      ),
      for (int i = 19; i < 26; i++)
        AlphabetKeys(
          key: UniqueKey(),
          alphabet: keyboardKeys[i],
          onKeyPressed: inputFunction,
        ),
      AlphabetKeys(
        key: ObjectKey(delKey),
        alphabet: delKey,
        width: 15 ,
        onKeyPressed: inputFunction,
      ),
    ]);
  }

  // Widget _rowFour() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       AlphabetKeys(
  //         key: UniqueKey(),
  //         alphabet: Letter(value: "Enter"),
  //         width: 40,
  //         onKeyPressed: inputFunction,
  //       ),
  //       AlphabetKeys(
  //         key: UniqueKey(),
  //         alphabet: Letter(value: "Delete"),
  //         width: 40 ,
  //         onKeyPressed: inputFunction,
  //       ),
  //     ],
  //   );
  // }
}
