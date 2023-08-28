import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/testing_page.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  late List<String> wordsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            wordsList = (jsonDecode(snapshot.data!.body.toString())["ResultList"][0]["Paragraph"]).split(" ");
            return TestingPage(temperoryText: wordsList, appBarHeading: "Words Practice");
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
        .get(Uri.parse("http://Api.aswdc.in/Api/TypingMaster/GetWordsByLanguageID/GetWordsByLanguageID/3/TST",),
        headers: {"API_KEY":"1234"});
    return response;
  }

}
