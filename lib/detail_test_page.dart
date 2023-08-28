import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gujarati_shruti_fonts_typing/test_page.dart';

import 'demo.dart';

class DetailTestPage extends StatefulWidget {
  String temperoryText;

  DetailTestPage({Key? key, required this.temperoryText}) {}

  @override
  State<DetailTestPage> createState() => _DetailTestPageState();
}

Map<String, int> timerValue = {
  "1 min": 60,
  "2 min": 120,
  "5 min": 300,
  "10 min": 600
};
String? dropdownValue;
late int timerSeconds;
Timer? timer;
int timerActive = 0;
int stopButton = 0;

class _DetailTestPageState extends State<DetailTestPage> {
  TextEditingController inputController = TextEditingController(text: "");
  String displayGujaratiText = "";
  String temp = "";
  List<String> displaySentence = [""];
  int listIndex = 0;
  late List<Color> colorList;
  var textColor = Colors.red;
  int correctWordCount = 0;
  int incorrectWordCount = 0;
  int flag = 0;
  int colorIndex = 0;
  int speed = 0;
  ScrollController singlePageController = ScrollController();
  double jumpToIndex = 0;
  String correctWords = "";
  String incorrectWords = "";
  List<String> wordList = [];

  Widget getSpan(String a, Color c) {
    if (screenHeight! != null)
      return Text(
        a,
        style: TextStyle(color: c, fontSize: screenWidth! / 15),
      );
    else
      return Text(
        a,
        style: TextStyle(color: c, fontSize: 15),
      );
    ;
  }

  List<Widget> colorFunction(List<String> b, List<Color> color) {
    List<Widget> l = [];
    for (int i = 0; i < b.length; i++) {
      l.add(getSpan(b[i] + " ", color[i]));
    }
    return l;
  }

  List<Color> colorAppendList(int listLength) {
    List<Color> colors = [];
    for (int i = 0; i < listLength; i++) {
      colors.add(Colors.black);
    }
    return colors;
  }

  Size calcTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }

  @override
  void initState() {
    super.initState();
    displaySentence = widget.temperoryText.split(" ");
    colorList = colorAppendList(displaySentence.length);
  }

  double? screenWidth;
  double? screenHeight;

  @override
  Widget build(BuildContext context) {
    int timerStart = 0;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    void stopTimer() {
      timer?.cancel();
    }

    void startTimer() {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        if (timerSeconds > 0) {
          setState(() => timerSeconds--);
        } else {
          timerActive = 2;
          stopTimer();
          setState(() {});
        }
      });
    }

    return KeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKeyEvent: (value) {
        if (value.runtimeType.toString() == "KeyDownEvent" &&
            value.character != null) {
          if (value.character == "k" || value.character == "c") {
            wordList.add(value.character!);
          }
          calculateTime(displayGujaratiText.length);
          speed = getCPM(displayGujaratiText.length);
          temp = convertor(value.character);
          if (temp == " ") {
            jumpToIndex += calcTextSize(displaySentence[colorIndex] + " ",
                    TextStyle(fontSize: screenWidth! / 15))
                .width;
            singlePageController.jumpTo(jumpToIndex);
            if (displayGujaratiText.trim() ==
                displaySentence[listIndex].trim()) {
              correctWords += displaySentence[listIndex] + " ";
              incorrectWords += displaySentence[listIndex] + " ";
              colorList[colorIndex] = Colors.green;
              flag = 1;
            } else {
              correctWords += displaySentence[listIndex] + " ";
              incorrectWords += displayGujaratiText + " ";
              colorList[colorIndex] = Colors.red;
            }
            if (flag == 1) {
              flag = 0;

              correctWordCount++;
            } else {
              incorrectWordCount++;
            }
            textColor = Colors.red;
            colorIndex++;
            if (listIndex < displaySentence.length - 1) {
              listIndex++;
            } else {
              timerActive = 2;
              setState(() {});
            }
            displayGujaratiText = "";
          }
          if (displayGujaratiText.length > 0) {
            if (displayGujaratiText[displayGujaratiText.length - 1] == "્" &&
                temp == "ઉ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ુ";
              temp = "";
            } else if (temp == "હ" + "્" &&
                displayGujaratiText[displayGujaratiText.length - 2] == "ક" &&
                wordList[wordList.length - 1] == "c") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 2) +
                  "ચ" +
                  "્";
              temp = "";
            } else if (temp == "હ" + "્" &&
                displayGujaratiText[displayGujaratiText.length - 2] == "ચ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 2) +
                  "છ" +
                  "્";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "ઊ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૂ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ુ" &&
                temp == "ઉ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૂ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ઉ" &&
                temp == "ઉ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઊ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] !=
                    "અ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "આ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઇ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઊ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "એ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઍ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઓ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઑ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઔ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ા" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "િ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ી" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ુ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૂ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૅ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૄ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૢ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૣ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ે" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ો" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઋ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૠ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૡ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૦" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૧" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૨" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૩" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૪" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૫" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૬" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૭" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૮" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૯" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઽ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ં" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઁ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != " " &&
                displayGujaratiText[displayGujaratiText.length - 1] != "!" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "@" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "#" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\$" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "%" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "^" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "&" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "*" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "(" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ")" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "-" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "_" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "=" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "+" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "{" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "}" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "[" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "]" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ";" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ":" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\'" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\"" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "," &&
                displayGujaratiText[displayGujaratiText.length - 1] != "<" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "." &&
                displayGujaratiText[displayGujaratiText.length - 1] != ">" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "/" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "?" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "|" &&
                temp == "ઉ") {
              displayGujaratiText += "ૌ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "ઇ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "િ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] !=
                    "અ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "આ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઇ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઊ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "એ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઍ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઓ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઑ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઔ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ા" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "િ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ી" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ુ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૂ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૅ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૄ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૢ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૣ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ે" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ો" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઋ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૠ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૡ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૦" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૧" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૨" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૩" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૪" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૫" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૬" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૭" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૮" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૯" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઽ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ં" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઁ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != " " &&
                displayGujaratiText[displayGujaratiText.length - 1] != "!" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "@" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "#" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\$" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "%" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "^" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "&" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "*" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "(" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ")" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "-" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "_" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "=" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "+" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "{" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "}" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "[" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "]" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ";" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ":" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\'" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\"" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "," &&
                displayGujaratiText[displayGujaratiText.length - 1] != "<" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "." &&
                displayGujaratiText[displayGujaratiText.length - 1] != ">" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "/" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "?" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "|" &&
                temp == "ઇ") {
              displayGujaratiText += "ૈ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] !=
                    "અ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "આ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઇ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઊ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "એ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઍ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઓ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઑ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઔ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ા" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "િ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ી" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ુ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૂ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૅ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] == "ૃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૄ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૢ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૣ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ે" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ો" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઋ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૠ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૡ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૦" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૧" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૨" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૩" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૪" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૫" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૬" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૭" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૮" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૯" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઽ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ં" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઁ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != " " &&
                displayGujaratiText[displayGujaratiText.length - 1] != "!" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "@" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "#" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\$" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "%" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "^" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "&" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "*" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "(" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ")" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "-" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "_" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "=" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "+" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "{" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "}" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "[" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "]" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ";" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ":" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\'" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\"" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "," &&
                displayGujaratiText[displayGujaratiText.length - 1] != "<" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "." &&
                displayGujaratiText[displayGujaratiText.length - 1] != ">" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "/" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "?" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "|" &&
                temp == "ઇ") {
              displayGujaratiText += "ૄ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] !=
                    "અ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "આ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઇ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઊ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "એ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઍ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઓ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઑ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઔ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ા" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૈ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "િ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ી" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ુ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૂ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૅ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૉ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૄ" &&
                displayGujaratiText[displayGujaratiText.length - 1] == "ૢ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૣ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ે" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ો" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઋ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઌ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૠ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૡ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૦" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૧" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૨" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૩" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૪" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૫" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૬" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૭" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૮" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "૯" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ૐ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઽ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઃ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ં" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "ઁ" &&
                displayGujaratiText[displayGujaratiText.length - 1] != " " &&
                displayGujaratiText[displayGujaratiText.length - 1] != "!" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "@" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "#" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\$" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "%" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "^" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "&" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "*" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "(" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ")" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "-" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "_" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "=" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "+" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "{" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "}" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "[" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "]" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ";" &&
                displayGujaratiText[displayGujaratiText.length - 1] != ":" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\'" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "\"" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "," &&
                displayGujaratiText[displayGujaratiText.length - 1] != "<" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "." &&
                displayGujaratiText[displayGujaratiText.length - 1] != ">" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "/" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "?" &&
                displayGujaratiText[displayGujaratiText.length - 1] != "|" &&
                temp == "ઇ") {
              displayGujaratiText += "ૣ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "ઈ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ી";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "િ" &&
                temp == "ઇ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ી";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ઇ" &&
                temp == "ઇ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઈ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "અ") {
              displayGujaratiText = displayGujaratiText.substring(
                  0, displayGujaratiText.length - 1);

              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "આ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ા";
              temp = "";
            } else if (temp == "અ") {
              var krish = displayGujaratiText[displayGujaratiText.length - 1];
              if (displayGujaratiText[displayGujaratiText.length - 1] != "અ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "આ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઇ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઈ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઉ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઊ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "એ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઍ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઓ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઑ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઐ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઔ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ા" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૈ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૌ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "િ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ી" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ુ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૂ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૅ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૉ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૃ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૄ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૢ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૣ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ે" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ો" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઋ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઌ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૠ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૡ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૦" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૧" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૨" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૩" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૪" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૫" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૬" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૭" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૮" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "૯" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ૐ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઽ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઃ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ં" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != " " &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "ઁ" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "!" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "@" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "#" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "\$" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "%" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "^" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "&" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "*" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "(" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != ")" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "-" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "_" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "=" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "+" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "{" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "}" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "[" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "]" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != ";" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != ":" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "\'" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "\"" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "," &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "<" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "." &&
                  displayGujaratiText[displayGujaratiText.length - 1] != ">" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "/" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "?" &&
                  displayGujaratiText[displayGujaratiText.length - 1] != "|") {
                displayGujaratiText += "ા";
                temp = "";
              }
              if (displayGujaratiText[displayGujaratiText.length - 1] == "અ") {
                displayGujaratiText = displayGujaratiText.substring(
                        0, displayGujaratiText.length - 1) +
                    "આ";
                temp = "";
              }
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "એ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ે";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "એ" &&
                temp == "એ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઍ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "ઍ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૅ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ે" &&
                temp == "એ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૅ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "ઓ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ો";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ઓ" &&
                temp == "ઓ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઑ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "ઑ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૉ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ો" &&
                temp == "ઓ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૉ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "અ" &&
                temp == "ઇ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઐ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "અ" &&
                temp == "ઉ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઔ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "-" &&
                temp == "ર" + "્") {
              if (displayGujaratiText.length > 1) {
                if (displayGujaratiText[displayGujaratiText.length - 2] ==
                    "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ૃ";
                  temp = "";
                } else {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 1) +
                      "ઋ";
                  temp = "";
                }
              } else {
                displayGujaratiText = displayGujaratiText.substring(
                        0, displayGujaratiText.length - 1) +
                    "ઋ";
                temp = "";
              }
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ઋ" &&
                temp == "ઇ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૠ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "-" &&
                temp == "લ" + "્") {
              if (displayGujaratiText.length > 1) {
                if (displayGujaratiText[displayGujaratiText.length - 2] ==
                    "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ૢ";
                  temp = "";
                } else {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 1) +
                      "ઌ";
                  temp = "";
                }
              } else {
                displayGujaratiText = displayGujaratiText.substring(
                        0, displayGujaratiText.length - 1) +
                    "ઌ";
                temp = "";
              }
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ઌ" &&
                temp == "ઇ") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ૡ";
              temp = "";
            } else if (temp == "ગ" + "્") {
              if (displayGujaratiText.length > 1) {
                if (displayGujaratiText[displayGujaratiText.length - 2] ==
                        "ન" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ઙ" +
                      "્";
                  temp = "";
                }
              }
            } else if (temp == "જ" + "્") {
              if (displayGujaratiText.length > 1) {
                if (displayGujaratiText[displayGujaratiText.length - 2] ==
                        "ન" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ઞ" +
                      "્";
                  temp = "";
                }
              }
            } else if (temp == "હ" + "્") {
              if (displayGujaratiText.length > 1) {
                if (displayGujaratiText[displayGujaratiText.length - 2] ==
                        "ક" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ખ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "ગ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ઘ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "જ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ઝ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "ટ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ઠ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "ડ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ઢ્" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "ત" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "થ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "દ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ધ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "પ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ફ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "બ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "ભ" +
                      "્";
                  temp = "";
                } else if (displayGujaratiText[
                            displayGujaratiText.length - 2] ==
                        "સ" &&
                    displayGujaratiText[displayGujaratiText.length - 1] ==
                        "્") {
                  displayGujaratiText = displayGujaratiText.substring(
                          0, displayGujaratiText.length - 2) +
                      "શ" +
                      "્";
                  temp = "";
                }
              }
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                "્") {
              if (temp == "M") {
                displayGujaratiText = displayGujaratiText.substring(
                        0, displayGujaratiText.length - 1) +
                    "‌ં";
                temp = "";
              }
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ા" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૈ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૌ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "િ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ી" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ુ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૂ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૅ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૉ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૃ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૄ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૢ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ૣ" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ે" ||
                displayGujaratiText[displayGujaratiText.length - 1] == "ો") {
              if (temp == "M") {
                displayGujaratiText += "‌ં";
                temp = "";
              }
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "ં" &&
                temp == "M") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઁ";
              temp = "";
            } else if (displayGujaratiText[displayGujaratiText.length - 1] ==
                    "્" &&
                temp == "H") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "ઃ";
              temp = "";
            } else if (temp == "backspace") {
              displayGujaratiText = displayGujaratiText.substring(
                  0, displayGujaratiText.length - 1);
            }
          }
        } else if (value.logicalKey.debugName == "Backspace" &&
            value.runtimeType.toString() == "KeyDownEvent") {
          if (displayGujaratiText.length > 1) {
            displayGujaratiText = displayGujaratiText.substring(
                0, displayGujaratiText.length - 1);
          } else {
            displayGujaratiText = "";
          }
        }
      },
      child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                stopTimer();
                timerActive = 0;
                stopButton = 0;
                displayGujaratiText = "";
                temp = "";
                listIndex = 0;
                correctWordCount = 0;
                incorrectWordCount = 0;
                flag = 0;
                colorIndex = 0;
                speed = 0;
                jumpToIndex = 0;
                inputController.text = "";

                Navigator.of(context).pop();
              },
            ),
            title: Text("Faculty Details"),
            backgroundColor: Colors.cyan,
          ),
          body: timerActive == 0
              ? Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(children: [
                          Expanded(child: Container()),
                          Expanded(
                            flex: 20,
                            child: InkWell(
                              onTap: () {
                                timerSeconds = dropdownValue == null
                                    ? timerValue["1 min"]!
                                    : timerValue[dropdownValue]!;
                                timerActive = 1;
                                startTimer();
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.cyan,
                                child: Text(
                                  "Start",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth! / 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.white,
                              child: DropdownButton<String>(
                                value: dropdownValue == null
                                    ? "1 min"
                                    : dropdownValue,
                                items: [
                                  '1 min',
                                  '2 min',
                                  '5 min',
                                  '10 min'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: screenWidth! / 15),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(child: Container())
                        ]),
                      ),
                      Expanded(flex: 10, child: Container())
                    ],
                  ),
                )
              : timerActive == 1
                  ? Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(children: [
                              Expanded(child: Container()),
                              Expanded(
                                flex: 15,
                                child: InkWell(
                                  onTap: () {
                                    stopButton == 0
                                        ? stopTimer()
                                        : startTimer();
                                    stopButton = stopButton == 0 ? 1 : 0;
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.cyan,
                                    child: Text(
                                      stopButton == 0 ? "Stop" : "Resume",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: stopButton == 0
                                              ? screenWidth! / 15
                                              : screenWidth! / 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  child: Text(
                                    timerSeconds.toString(),
                                    style: TextStyle(
                                        fontSize: screenWidth! / 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 15,
                                child: InkWell(
                                  onTap: () {
                                    stopTimer();
                                    timerActive = 0;
                                    stopButton = 0;
                                    listIndex = 0;
                                    correctWordCount = 0;
                                    incorrectWordCount = 0;
                                    flag = 0;
                                    colorIndex = 0;
                                    speed = 0;
                                    jumpToIndex = 0;

                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.cyan,
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth! / 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(child: Container())
                            ]),
                          ),
                          Expanded(
                            flex: 10,
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: screenHeight! / 10),
                                  child: SingleChildScrollView(
                                    controller: singlePageController,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: colorFunction(
                                          displaySentence, colorList),
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        top: screenHeight! / 100),
                                    child: GestureDetector(
                                      onDoubleTap: () {
                                        if (inputController.text.isNotEmpty) {
                                          inputController.selection =
                                              TextSelection(
                                                  baseOffset: 0,
                                                  extentOffset: inputController
                                                      .text.length);
                                        }
                                      },
                                      child: Container(
                                        width: screenWidth! / 2,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              hintText: "Type",
                                              hintStyle: TextStyle(
                                                  color: Colors.black12)),
                                          enableInteractiveSelection: true,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: screenHeight! / 12),
                                          onChanged: (value) {
                                            displayGujaratiText += temp;
                                            setState(() {
                                              inputController.text =
                                                  displayGujaratiText;
                                              inputController.selection =
                                                  TextSelection.collapsed(
                                                      offset:
                                                          displayGujaratiText
                                                              .length);
                                              temp = "";
                                            });
                                          },
                                          controller: inputController,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                            width: screenWidth,
                            color: Colors.blueGrey,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Correct",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth! / 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Wrong",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth! / 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Accuracy",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth! / 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Speed",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: screenWidth! / 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Column(
                          children: [
                            Container(
                                color: Colors.white,
                                width: screenWidth,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          correctWordCount.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth! / 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          incorrectWordCount.toString(),
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: screenWidth! / 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          (((correctWordCount) /
                                                              (correctWordCount +
                                                                  incorrectWordCount)) *
                                                          100)
                                                      .toStringAsFixed(2) ==
                                                  "NaN"
                                              ? "0"
                                              : (((correctWordCount) /
                                                          (correctWordCount +
                                                              incorrectWordCount)) *
                                                      100)
                                                  .toStringAsFixed(2),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth! / 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          speed.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: screenWidth! / 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Expanded(
                                  flex: 20,
                                  child: InkWell(
                                      onTap: () {
                                        stopTimer();
                                        timerActive = 0;
                                        stopButton = 0;
                                        displayGujaratiText = "";
                                        temp = "";
                                        listIndex = 0;
                                        correctWordCount = 0;
                                        incorrectWordCount = 0;
                                        flag = 0;
                                        colorIndex = 0;
                                        speed = 0;
                                        jumpToIndex = 0;
                                        inputController.text = "";

                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: screenHeight! / 5),
                                        child: Text(
                                          "Restart",
                                          style: TextStyle(
                                              fontSize: screenWidth! / 13,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                                Expanded(child: Container()),
                                Expanded(
                                  flex: 20,
                                  child: InkWell(
                                      onTap: () {
                                        stopTimer();
                                        timerActive = 0;
                                        stopButton = 0;
                                        displayGujaratiText = "";
                                        temp = "";
                                        listIndex = 0;
                                        correctWordCount = 0;
                                        incorrectWordCount = 0;
                                        flag = 0;
                                        colorIndex = 0;
                                        speed = 0;
                                        jumpToIndex = 0;
                                        inputController.text = "";

                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: screenHeight! / 5),
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                              fontSize: screenWidth! / 13,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                                Expanded(child: Container())
                              ],
                            )
                          ],
                        )
                      ],
                    )),
    );
  }
}

String convertor(var a) {
  if (a == "k" || a == "c") {
    return "ક" + "્";
  } else if (a == "g") {
    return "ગ" + "્";
  } else if (a == "c") {
    return "ચ" + "્";
  } else if (a == "j") {
    return "જ" + "્";
  } else if (a == "z") {
    return "ઝ" + "્";
  } else if (a == "T") {
    return "ટ" + "્";
  } else if (a == "D") {
    return "ડ" + "્";
  } else if (a == "N") {
    return "ણ" + "્";
  } else if (a == "t") {
    return "ત" + "્";
  } else if (a == "d") {
    return "દ" + "્";
  } else if (a == "n") {
    return "ન" + "્";
  } else if (a == "p") {
    return "પ" + "્";
  } else if (a == "f") {
    return "ફ" + "્";
  } else if (a == "b") {
    return "બ" + "્";
  } else if (a == "m") {
    return "મ" + "્";
  } else if (a == "y") {
    return "ય" + "્";
  } else if (a == "r") {
    return "ર" + "્";
  } else if (a == "l") {
    return "લ" + "્";
  } else if (a == "L") {
    return "ળ" + "્";
  } else if (a == "v" || a == "w") {
    return "વ" + "્";
  } else if (a == "s") {
    return "સ" + "્";
  } else if (a == "h") {
    return "હ" + "્";
  } else if (a == "S") {
    return "ષ" + "્";
  } else if (a == "u") {
    return "ઉ";
  } else if (a == "U") {
    return "ઊ";
  } else if (a == "i") {
    return "ઇ";
  } else if (a == "I") {
    return "ઈ";
  } else if (a == "a") {
    return "અ";
  } else if (a == "A") {
    return "આ";
  } else if (a == "e") {
    return "એ";
  } else if (a == "E") {
    return "ઍ";
  } else if (a == "o") {
    return "ઓ";
  } else if (a == "O") {
    return "ઑ";
  } else if (a == "E") {
    return "ઍ";
  } else if (a == "E") {
    return "ઍ";
  } else if (a == "G") {
    return "ઙ" + "્";
  } else if (a == "J") {
    return "ઞ" + "્";
  } else if (a == "'") {
    return "ઽ";
  } else if (a == "W") {
    return "ૐ";
  } else if (a == "0") {
    return "૦";
  } else if (a == "1") {
    return "૧";
  } else if (a == "2") {
    return "૨";
  } else if (a == "3") {
    return "૩";
  } else if (a == "4") {
    return "૪";
  } else if (a == "5") {
    return "૫";
  } else if (a == "6") {
    return "૬";
  } else if (a == "7") {
    return "૭";
  } else if (a == "8") {
    return "૮";
  } else if (a == "X") {
    return "ક્ષ" + "્";
  } else if (a == "9") {
    return "૯";
  } else {
    return "$a";
  }
}
