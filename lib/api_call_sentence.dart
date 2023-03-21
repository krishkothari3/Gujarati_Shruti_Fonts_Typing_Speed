import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/sentences.dart';
import 'package:http/http.dart' as http;

class ApiCallSentence extends StatefulWidget {
  const ApiCallSentence({Key? key}) : super(key: key);

  @override
  State<ApiCallSentence> createState() => _ApiCallSentenceState();
}

class _ApiCallSentenceState extends State<ApiCallSentence> {
  String sentence = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print((jsonDecode(snapshot.data!.body.toString())["ResultList"][0]["Paragraph"]));
            sentence = (jsonDecode(snapshot.data!.body.toString())["ResultList"][0]["Paragraph"]);
            return SentencePage(temperoryText: sentence);
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }, future: getDataFromApi(),
      ),
    );
  }
  Future<http.Response> getDataFromApi() async {
    var response = await http
        .get(Uri.parse("http://Api.aswdc.in/Api/TypingMaster/GetSentencesByLanguageID/GetSentencesByLanguageID/3/TST",),
        headers: {"API_KEY":"1234"});
    // print(response.body);
    return response;
  }
}
