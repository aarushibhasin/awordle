import 'package:awordle/dictonary.dart';
import 'package:awordle/game_keyboard.dart';
import 'package:awordle/results_screen.dart';
import 'package:awordle/size_utils.dart';
import 'package:awordle/word_row.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'data/word.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Word> attempts = [Word(), Word(), Word(), Word(), Word(), Word()];
  int activeRow = 0;
  late Set<String> database;
  Random random = Random();
  late String _targetWord;
  List<Letter> keyboardKeys = [];
  String keyboardString = "QWERTYUIOPASDFGHJKLZXCVBNM";
  @override
  void initState() {
    _loadDictionary();
    _initKeyBoard();
    super.initState();
  }

  void _initKeyBoard() {
    keyboardString.characters.forEach((character) {
      keyboardKeys.add(Letter(value: character));
    });
  }

  void _loadDictionary() async {
    database = await generateDictionary();
    _generateARandomWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Guess the Word"),
      ),
      body: Center(
        child: Container(
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(5),
                // color: Colors.red,
                height: SizeUtils.h*55,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WordRow(
                        key: ObjectKey(attempts[0]),
                        word: attempts[0],
                      ),
                      WordRow(key: ObjectKey(attempts[1]), word: attempts[1]),
                      WordRow(key: ObjectKey(attempts[2]), word: attempts[2]),
                      WordRow(key: ObjectKey(attempts[3]), word: attempts[3]),
                      WordRow(key: ObjectKey(attempts[4]), word: attempts[4]),
                      WordRow(key: ObjectKey(attempts[5]), word: attempts[5]),
                    ]),
              ),
              GameKeyboard(
                keyboardKeys: keyboardKeys,
                inputFunction: createWord,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _generateARandomWord() {
    _targetWord = database.elementAt(random.nextInt(database.length - 1));
    print("Target word is $_targetWord");
  }

  void createWord(String alphabetPressed) {
    // print("in inout function");

    setState(() {
      if (alphabetPressed == "Enter") {
        String word = attempts[activeRow].getWholeWord();
        if (word.length < 5) {
          _showAlert("The word is incomplete");
          return;
        }
        bool isWordValid = _validateWordFromDictionary(word);
        if (isWordValid) {
          int matchedLetters = _matchWord(attempts[activeRow]);
          if (matchedLetters == 5) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultScreen(attempts: activeRow,)),
              );

              return;
            });
          }

          print("Word accepted. moving to next line");

          activeRow < attempts.length - 1
              ? activeRow += 1
              : _showAlert("Attempts over. You have lost the game");
          print("active row is $activeRow");
        } else {
          _showAlert("The word does not exist in the dictionary");
        }
      } else if (alphabetPressed == "Del") {
        attempts[activeRow].removeAlphabet();
      } else {
        attempts[activeRow].addAlphabets(alphabetPressed);
      }
    });
  }

  bool _validateWordFromDictionary(String word) {
    return database.contains(word);
  }

  int _matchWord(Word word) {
    int index = 0;
    int matchedLetters = 0;
    for (var letter in word.letters) {
      if (_targetWord.contains(letter.value)) {
        letter.type = "PARTIAL_MATCH";
        int keyboardIndex = keyboardKeys.indexOf(letter);

        Letter matchedKey = keyboardKeys.elementAt(keyboardIndex);
        if (matchedKey.type != "FULL_MATCH") {
          matchedKey.type = "PARTIAL_MATCH";
        }
      }
      if (letter.value == _targetWord[index]) {
        letter.type = "FULL_MATCH";
        int keyboardIndex = keyboardKeys.indexOf(letter);
        keyboardKeys.elementAt(keyboardIndex).type = "FULL_MATCH";
        matchedLetters++;
      }

      index++;
    }
    return matchedLetters;
  }

  void _showAlert(String message) {
    print(message);
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Wordle Alert"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
