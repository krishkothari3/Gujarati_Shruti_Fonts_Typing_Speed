import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gujarati_shruti_fonts_typing/detail_test_page.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Test List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(227, 88, 73, 1),
      ),
      body: FutureBuilder<http.Response>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount:
                  jsonDecode(snapshot.data!.body.toString())["ResultList"]
                      .length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return DetailTestPage(
                          temperoryText:
                              jsonDecode(snapshot.data!.body.toString())[
                                      "ResultList"][index]["Paragraph"]
                                  .toString(),
                        );
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8,bottom: 5,top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jsonDecode(snapshot.data!.body.toString())[
                                      "ResultList"][index]["Title"]
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              jsonDecode(snapshot.data!.body.toString())[
                                          "ResultList"][index]["Paragraph"]
                                      .toString()
                                      .substring(0, 80) +
                                  "....",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getDataFromApi(),
      ),
    );
  }

  Future<http.Response> getDataFromApi() async {
    var response = await http.get(
        Uri.parse(
          "http://Api.aswdc.in/Api/TypingMaster/GetSentencesByLanguageID/GetSentencesByLanguageID/3/TST",
        ),
        headers: {"API_KEY": "1234"});

    return response;
  }
}
