import 'dart:convert';
import 'dart:io';

// import 'package:faculty_api/insert_faculty.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty Details"),
        actions: [
        ],
      ),
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(color: Colors.black,);
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
        headers: {HttpHeaders.authorizationHeader: "API_KEY=1234"});
    print(response.body);
    return response;
  }

}
