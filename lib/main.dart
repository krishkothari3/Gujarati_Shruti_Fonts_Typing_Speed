import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gujarati_shruti_fonts_typing/api_call.dart';
import 'package:gujarati_shruti_fonts_typing/api_call_sentence.dart';
import 'package:gujarati_shruti_fonts_typing/contact_us.dart';
import 'package:gujarati_shruti_fonts_typing/home_screen_page.dart';
import 'package:gujarati_shruti_fonts_typing/letters.dart';
import 'package:gujarati_shruti_fonts_typing/sentences.dart';
import 'package:gujarati_shruti_fonts_typing/test_page.dart';
import 'package:gujarati_shruti_fonts_typing/testing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreenPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
