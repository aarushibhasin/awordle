import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';

Future<Set<String>> generateDictionary() async {
  // Directory documentRoot = await getApplicationDocumentsDirectory();
  // String dicPath = documentRoot.path + Platform.pathSeparator + dicName + ".txt";
  // File dicFile = File(dicPath);
  String dicContents = await rootBundle.loadString("assets/All.txt");
  Set<String> database = {};
  LineSplitter.split(dicContents).forEach((line) {
    if(line.length == 5) {
      database.add(line.toUpperCase());
    }
  });

  print("Dictionary loaded succerssfully ${database.length}");
  return database;
}