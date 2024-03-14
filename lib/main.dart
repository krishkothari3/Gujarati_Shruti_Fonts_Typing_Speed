import 'package:aswdc_flutter_pub/aswdc_flutter_pub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gujarati_shruti_fonts_typing/api_call.dart';
import 'package:gujarati_shruti_fonts_typing/api_call_sentence.dart';
import 'package:gujarati_shruti_fonts_typing/contact_us.dart';
import 'package:gujarati_shruti_fonts_typing/home_screen_page.dart';
import 'package:gujarati_shruti_fonts_typing/letters.dart';
import 'package:gujarati_shruti_fonts_typing/sentences.dart';
import 'package:gujarati_shruti_fonts_typing/splash_screen.dart';
import 'package:gujarati_shruti_fonts_typing/test_page.dart';
import 'package:gujarati_shruti_fonts_typing/testing_page.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType)
    {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: SplashScreenWidget(),
      );
    });
  }
}


