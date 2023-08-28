import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/api_call.dart';
import 'package:gujarati_shruti_fonts_typing/api_call_sentence.dart';
import 'package:gujarati_shruti_fonts_typing/contact_us.dart';
import 'package:gujarati_shruti_fonts_typing/letters.dart';
import 'package:gujarati_shruti_fonts_typing/sentences.dart';
import 'package:gujarati_shruti_fonts_typing/test_page.dart';
import 'package:gujarati_shruti_fonts_typing/testing_page.dart';

double? screenWidth;
double? screenHeight;

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Typing Speed Test",
          style: TextStyle(fontSize: screenHeight! / 30),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Card(
              elevation: 20,
              child: Container(
                margin: EdgeInsets.only(top: screenHeight! / 100),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(screenHeight! / 40),
                            bottomRight: Radius.circular(screenHeight! / 40))),
                    padding: EdgeInsets.only(
                        top: screenHeight! / 80,
                        bottom: screenHeight! / 100,
                        left: screenWidth! / 10,
                        right: screenWidth! / 10),
                    child: Text(
                      "Practice",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth! / 20),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return LetterPage();
                                },
                              ));
                            },
                            child: practiceTypeIcons(
                                iconPath: "assets/images_png/ic_character.png",
                                textMessage: "Character\nPractice")),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ApiCall();
                                },
                              ));
                            },
                            child: practiceTypeIcons(
                                iconPath: "assets/images_png/ic_word.png",
                                textMessage: "Word\nPractice")),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ApiCallSentence();
                                },
                              ));
                            },
                            child: practiceTypeIcons(
                                iconPath: "assets/images_png/ic_sentence.png",
                                textMessage: "Sentence\nPractice")),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
          Center(
            child: Card(
              elevation: 20,
              child: Container(
                margin: EdgeInsets.only(top: screenHeight! / 100),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(screenHeight! / 40),
                            bottomRight: Radius.circular(screenHeight! / 40))),
                    padding: EdgeInsets.only(
                        top: screenHeight! / 80,
                        bottom: screenHeight! / 100,
                        left: screenWidth! / 10,
                        right: screenWidth! / 10),
                    child: Text(
                      "Other",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth! / 20),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const ContactUs();
                                },
                              ));
                            },
                            child: practiceTypeIcons(
                                iconPath: "assets/images_png/ic_contact.png",
                                textMessage: "Contact Us")),
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return TestPage();
                                },
                              ));
                            },
                            child: practiceTypeIcons(
                                iconPath: "assets/images_png/ic_developer.png",
                                textMessage: "Give a test")),
                      )
                    ],
                  )
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget practiceTypeIcons(
    {required String iconPath, required String textMessage}) {
  return Container(
    margin:
        EdgeInsets.only(top: screenHeight! / 30, bottom: screenHeight! / 30),
    child: Column(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            iconPath,
            height: screenHeight! / 10,
            width: screenWidth! / 5,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: screenHeight! / 30),
          child: Text(
            textMessage,
            style: TextStyle(fontSize: screenHeight! / 45),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}
