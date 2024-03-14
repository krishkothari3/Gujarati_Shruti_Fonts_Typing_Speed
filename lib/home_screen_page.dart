import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gujarati_shruti_fonts_typing/api_call.dart';
import 'package:gujarati_shruti_fonts_typing/api_call_sentence.dart';
import 'package:gujarati_shruti_fonts_typing/contact_us.dart';
import 'package:gujarati_shruti_fonts_typing/developerScreenInApp.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(227, 88, 73, 1),
        title: Text(
          "Gujarati shruti",
          style: TextStyle(fontSize: screenHeight! / 30,color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share,color: Colors.white,))],
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
                        color: const Color.fromRGBO(227, 88, 73, 1),
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
                        color: const Color.fromRGBO(227, 88, 73, 1),
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
                      ),
                      Expanded(
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return DeveloperScreenInApp();
                                },
                              ));
                            },
                            child: practiceTypeIcons(
                                iconPath: "assets/images_png/ic_profile.png",
                                textMessage: "About Us")),
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
