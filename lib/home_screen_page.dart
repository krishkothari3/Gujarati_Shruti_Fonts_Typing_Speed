import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/letters.dart';
import 'package:gujarati_shruti_fonts_typing/sentences.dart';
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
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(252, 131, 105, 1),
        title:  Text(
          "Typing Speed Test",
          style: TextStyle(fontSize: screenHeight!/30),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: Column(children: [
        // Center(
        //   child: Container(
        //     margin: EdgeInsets.only(top: screenHeight! / 100),
        //     color: Colors.white,
        //     width: screenWidth! / 1.05,
        //     height: screenHeight! / 6.5,
        //     child: Column(children: [
        //       Column(
        //         children: [
        //           Center(
        //             child: Container(
        //               decoration: BoxDecoration(
        //                   color: Color.fromRGBO(116, 116, 116, 1),
        //                   borderRadius: BorderRadius.only(
        //                       bottomLeft: Radius.circular(screenHeight! / 35),
        //                       bottomRight: Radius.circular(screenHeight! / 35))),
        //               padding: EdgeInsets.only(
        //                   top: screenHeight! / 100,
        //                   bottom: screenHeight! / 150,
        //                   left: screenWidth! / 15,
        //                   right: screenWidth! / 15),
        //               child:  Text(
        //                 "Language",
        //                 style: TextStyle(color: Colors.white, fontSize: screenHeight! / 40),
        //               ),
        //             ),
        //           ),
        //           Center(
        //             child: Container(
        //               alignment: Alignment.centerLeft,
        //               padding: EdgeInsets.only(left: screenWidth! / 30),
        //               margin: EdgeInsets.only(top: screenHeight! / 100),
        //               height: screenHeight! / 13,
        //               width: screenWidth! / 1.1,
        //               decoration: BoxDecoration(
        //                   border: Border.all(color: Colors.black, width: 1)),
        //               child: Text(
        //                 "Gujarati Shruti",
        //                 style: TextStyle(
        //                     fontSize: screenHeight! / 40, fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //           )
        //         ],
        //       )
        //     ]),
        //   ),
        // ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight! / 100),
            color: Colors.white,
            width: screenWidth! / 1.05,
            height: screenHeight! / 4,
            child: Column(children: [
              Container(
                decoration:  BoxDecoration(
                    color: Color.fromRGBO(116, 116, 116, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(screenHeight! / 40),
                        bottomRight: Radius.circular(screenHeight! / 40))),
                padding: EdgeInsets.only(
                    top: screenHeight! / 100,
                    bottom: screenHeight! / 150,
                    left: screenWidth! / 15,
                    right: screenWidth! / 15),
                child: Text(
                  "Practice",
                  style: TextStyle(color: Colors.white, fontSize: screenHeight! / 40),
                ),
              ),
              Row(
                children: [
                  InkWell(onTap:() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return LetterPage();
                    },));
                  },child: practiceTypeIcons(iconPath: "assets/images_png/ic_character.png",textMessage: "Character\nPractice")),
                  InkWell(onTap:() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return TestingPage(temperoryText: ["મારુ","નામ","ક્રિશ","છે"],appBarHeading: "Words Practice",);
                    },));
                  },child: practiceTypeIcons(iconPath: "assets/images_png/ic_word.png", textMessage: "Word\nPractice")),
                  InkWell(onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return SentencePage(temperoryText: """દરેક વ્યક્તિને શિક્ષણનો અધિકાર છે. ઓછામાં ઓછું પ્રાથમિક અને પાયાના તબક્કાઓમાં શિક્ષણ મફત રહેશે. પ્રાથમિક શિક્ષણ ફરજિયાત રહેશે. વિશેષ વિઘાવિષયક અને વ્યવસાયી શિક્ષણ સામાન્યતઃ ઉપલબ્ધ રહેશે અને યોગ્યતાના ધોરણ પર ઉચ્ચ શિક્ષણ પ્રાપ્ત કરવાનો સર્વને સમાન અધિકાર રહેશે.
                          //     માનવવ્યક્તિત્વના સંપૂર્ણ વિકાસ અને માનવહક્કો અને મૂળભૂત સ્વતંત્રતાઓ પ્રત્યેના માનને દઢિભૂત કરવા તરફ શિક્ષણનું લક્ષ રાખવામાં આવશે. બધાં રાષ્ટ્રો, જાતિ અથવા ધાર્મિક સમૂહો વચ્ચે તે સમજ, સહિષ્ણુતા અને મૈત્રી બઢાવશે અને શાંતિની જાળવણી માટેની સંયુકત રાષ્ટ્રોની પ્રવૃત્તિઓને આગળ ધપાવશે.""".replaceAll('ં', 'ં'));
                    },));
                  },child: practiceTypeIcons(iconPath: "assets/images_png/ic_sentence.png", textMessage: "Sentence\nPractice"))
                ],
              )
            ]),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight! / 100),
            color: Colors.white,
            width: screenWidth! / 1.05,
            height: screenHeight! / 4,
            child: Column(children: [
              Container(
                decoration:  BoxDecoration(
                    color: Color.fromRGBO(116, 116, 116, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(screenHeight! / 40),
                        bottomRight: Radius.circular(screenHeight! / 40))),
                padding: EdgeInsets.only(
                    top: screenHeight! / 100,
                    bottom: screenHeight! / 150,
                    left: screenWidth! / 15,
                    right: screenWidth! / 15),
                child: Text(
                  "Other",
                  style: TextStyle(color: Colors.white, fontSize: screenHeight! / 40),
                ),
              ),
              Row(
                children: [
                  InkWell(onTap:() {

                  },child: practiceTypeIcons(iconPath: "assets/images_png/ic_profile.png",textMessage: "Profile")),
                  InkWell(onTap:() {

                  },child: practiceTypeIcons(iconPath: "assets/images_png/ic_contact.png", textMessage: "Contact Us")),
                  InkWell(onTap: () {

                  },child: practiceTypeIcons(iconPath: "assets/images_png/ic_developer.png", textMessage: "Developerx"))
                ],
              )
            ]),
          ),
        ),
      ]),
    );
  }
}

Widget practiceTypeIcons({required String iconPath,required String textMessage}) {
  return Container(
    height: screenHeight! / 5.5,
    width: screenWidth! / 3.5,
    margin:
        EdgeInsets.only(left: screenWidth! / 35, top: screenHeight! / 100),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              bottom: screenHeight! / 60, top: screenHeight! / 120),
          color: Colors.white,
          height: screenHeight! / 10,
          width: screenWidth! / 3.5,
          child: Image.asset(
            iconPath,
            height: screenHeight! / 7,
            width: screenWidth! / 7,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          textMessage,
          style: TextStyle(fontSize: screenHeight! / 45),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
