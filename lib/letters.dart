import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/testing_page.dart';

class LetterPage extends StatefulWidget {
  const LetterPage({Key? key}) : super(key: key);

  @override
  State<LetterPage> createState() => _LetterPageState();
}

List<String> displayCharacters = ["૦","૧","૨","૩","૪","૫","૬","૭","૮","૯","અ","આ","ઇ","ઈ","ઉ","ઊ","એ","ઐ","ઓ","ઔ","ક","ખ","ગ","ઘ","ચ","છ","જ","ઝ","ટ","ઠ","ડ","ઢ","ણ","ત","થ","દ","ધ","ન","પ","ફ","બ","ભ","મ","ય","ર","લ","ળ","વ","શ","ષ","સ","હ","ળ","ક્","ષ","જ્ઞ"];
class _LetterPageState extends State<LetterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestingPage(temperoryText: displayCharacters,appBarHeading: "Characters Practice"),
    );
  }
}
