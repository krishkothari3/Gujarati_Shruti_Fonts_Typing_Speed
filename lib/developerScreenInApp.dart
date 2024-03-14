import 'package:aswdc_flutter_pub/aswdc_flutter_pub.dart';
import 'package:flutter/material.dart';

class DeveloperScreenInApp extends StatefulWidget {
  const DeveloperScreenInApp({Key? key}) : super(key: key);

  @override
  State<DeveloperScreenInApp> createState() => _DeveloperScreenInAppState();
}

class _DeveloperScreenInAppState extends State<DeveloperScreenInApp> {
  @override
  Widget build(BuildContext context) {
    return DeveloperScreen(developerName: 'Krish Kothari',
        mentorName: 'Mehul Bhundiya',
        exploredByName: 'Krish Kothari',
        isAdmissionApp: false,
        shareMessage: 'This is a mobile application which is developed using Flutter. This app provides features such as typing speed, typing accuracy, counts of correct and incorrect words and much more in Gujarati language(Shruti Fonts).',
        appTitle: 'Gujarati Shruti Font Typing',
        appLogo: 'assets/images_jpg/appLogo.jpg');
  }
}
