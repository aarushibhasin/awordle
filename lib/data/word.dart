

class Word {
  List<Letter> letters = [];

  void addAlphabets(String alphabet) {
       letters.add(Letter(value: alphabet));
  }

  String getWholeWord() {
    String completeWord = "";
     for (var letter in letters) {
       completeWord +=letter.value;
    }

    return completeWord;
  }

  void removeAlphabet() {

    letters.isNotEmpty ? letters.removeLast() : {};
  }

  bool checkWordFromDictionary() {
    return false;
  }

}


class Letter {



  String value;
  String type = "NONE";
  Letter({ this.value = ""});

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is Letter &&
              runtimeType == other.runtimeType &&
              value == other.value;

  @override
  int get hashCode => value.hashCode;

}