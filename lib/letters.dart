import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/testing_page.dart';

class LetterPage extends StatefulWidget {
  const LetterPage({Key? key}) : super(key: key);

  @override
  State<LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestingPage(temperoryText: const ["મા","રુ","ના","મ","મે","હુ","લ","સ","ર","છે"],appBarHeading: "Characters Practice"),
    );
  }
}
