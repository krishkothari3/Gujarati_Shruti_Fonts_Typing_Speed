import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/demo.dart';

class TestingPage extends StatefulWidget {
  List<String> temperoryText;
  String appBarHeading;

  TestingPage(
      {Key? key, required this.temperoryText, required this.appBarHeading})
      : super(key: key);

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  int activePage = 0;
  TextEditingController inputController = TextEditingController(text: "");
  String displayGujaratiText = "";
  String temp = "";

  int listIndex = 0;
  var textColor = Colors.red;
  int correctWordCount = 0;
  int incorrectWordCount = 0;
  int flag = 0;
  var speed = 0;
  String correctWords = "";
  String incorrectWords = "";
  List<String> wordList = [];

  @override
  void initState() {
    widget.temperoryText.shuffle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
            textColor = Colors.red;
            if (flag == 1) {
              correctWords += widget.temperoryText[listIndex] + " ";
              incorrectWords += widget.temperoryText[listIndex] + " ";
              correctWordCount++;
              flag = 0;
            } else {
              correctWords += widget.temperoryText[listIndex] + " ";
              incorrectWords += displayGujaratiText + " ";
              incorrectWordCount++;
            }
            if (listIndex < widget.temperoryText.length - 1) {
              listIndex++;
            } else {
              activePage = 1;
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
                    "્" &&
                temp == "M") {
              displayGujaratiText = displayGujaratiText.substring(
                      0, displayGujaratiText.length - 1) +
                  "‌ં";
              temp = "";
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
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromRGBO(227, 88, 73, 1),
            title: Text(
              widget.appBarHeading!,
              style: TextStyle(fontSize: screenHeight! / 30,color: Colors.white),
            ),
          ),
          body: activePage == 0
              ? SingleChildScrollView(
                  child: Column(children: [
                    Container(
                        width: screenWidth,
                        color: const Color.fromRGBO(227, 88, 73, 1),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Correct",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth! / 20,
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
                                      fontSize: screenWidth / 20,
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
                                      fontSize: screenWidth! / 20,
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
                                      fontSize: screenWidth! / 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
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
                                    fontSize: screenWidth! / 20,
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
                                      fontSize: screenWidth! / 20,
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
                                      fontSize: screenWidth! / 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      color: const Color.fromRGBO(227, 88, 73, 1),
                      height: screenHeight / 200,
                      width: screenWidth,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: screenHeight / 20),
                      child: Text(
                        widget.temperoryText[listIndex],
                        style: TextStyle(
                            fontSize: screenWidth! / 7, color: textColor),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: screenHeight / 100),
                        child: GestureDetector(
                          onDoubleTap: () {
                            if (inputController.text.isNotEmpty) {
                              inputController.selection = TextSelection(
                                  baseOffset: 0,
                                  extentOffset: inputController.text.length);
                            }
                          },
                          child: Container(
                            width: screenWidth / 2,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Type",
                                  hintStyle: TextStyle(color: Colors.black12)),
                              enableInteractiveSelection: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: screenWidth! / 6),
                              onChanged: (value) {
                                displayGujaratiText += temp;
                                setState(() {
                                  inputController.text = displayGujaratiText;
                                  inputController.selection =
                                      TextSelection.collapsed(
                                          offset: displayGujaratiText.length);
                                  temp = "";
                                });
                                if (inputController.text.trim() ==
                                    widget.temperoryText[listIndex].trim()) {
                                  textColor = Colors.green;
                                  flag = 1;
                                } else {
                                  textColor = Colors.red;
                                }
                              },
                              controller: inputController,
                            ),
                          ),
                        )),
                    Container(
                      width: screenWidth,
                      color: Colors.white,
                      margin: EdgeInsets.only(top: screenHeight / 15),
                      child: Column(
                        children: [
                          Text(
                            "Original Paragraph",
                            style: TextStyle(
                                fontSize: screenWidth! / 15,
                                color: const Color.fromRGBO(49, 74, 94, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: screenHeight / 50),
                            child: Text(
                              correctWords,
                              style: TextStyle(
                                  fontSize: screenWidth / 15,
                                  color: const Color.fromRGBO(49, 74, 94, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      color: Colors.white,
                      margin: EdgeInsets.only(top: screenHeight / 30),
                      child: Column(
                        children: [
                          Text(
                            "Typed Paragraph",
                            style: TextStyle(
                                fontSize: screenWidth! / 15,
                                color: const Color.fromRGBO(49, 74, 94, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: screenHeight / 50),
                            child: Text(
                              incorrectWords,
                              style: TextStyle(
                                  fontSize: screenWidth! / 15,
                                  color: const Color.fromRGBO(49, 74, 94, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                )
              : Column(
                  children: [
                    Container(
                        width: screenWidth,
                        color: const Color.fromRGBO(49, 74, 94, 1),
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
                            color: Colors.grey,
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
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    margin:
                                        EdgeInsets.only(top: screenHeight! / 5),
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                          fontSize: screenWidth! / 13,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                            Expanded(child: Container()),
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
