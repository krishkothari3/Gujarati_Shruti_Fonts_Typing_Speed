import 'package:aswdc_flutter_pub/aswdc_flutter_pub.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:gujarati_shruti_fonts_typing/home_screen_page.dart';

class SplashScreenWidget extends StatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    // Delay for 1 second, then navigate to the next screen
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return HomeScreenPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      appLogo: 'assets/images_jpg/appLogo.jpg',
      appName: 'Gujarati Shruti Font Typing',
      appVersion: '1.0',
    );
  }
}
