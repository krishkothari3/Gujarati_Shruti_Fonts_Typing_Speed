import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

String? appName;
String? packageName;
String? version;
String? buildNumber;

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
    super.initState();
  }

  double? screenWidth;
  double? screenHeight;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();

  void _submit() {
    if (formKey.currentState!.validate()) {
      sendMessage().then((value) => (value) {
            Navigator.of(context).pop();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Contact Us",style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromRGBO(227, 88, 73, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          )),
      body: Card(
        elevation: 20,
        child: Container(
            height: screenHeight! / 1.8,
            color: Colors.white,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                          child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 30,
                        child: TextFormField(
                          controller: nameController,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              labelText: "  Name",
                              labelStyle: TextStyle(
                                  fontSize: screenWidth! / 30,
                                  fontWeight: FontWeight.bold)),
                          validator: (value) {
                            if (value == null || value == "") {
                              return "Enter Name";
                            }
                          },
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ))),
                  Expanded(
                      child: Container(
                          child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 30,
                        child: TextFormField(
                          controller: mobileController,
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value == "") {
                              return "Enter mobile number";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "  Mobile",
                              labelStyle: TextStyle(
                                  fontSize: screenWidth! / 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ))),
                  Expanded(
                      child: Container(
                          child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 30,
                        child: TextFormField(
                          controller: emailController,
                          style: TextStyle(fontSize: 20),
                          validator: (value) {
                            if (value == null || value == "") {
                              return "Enter Email";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "  Email",
                              labelStyle: TextStyle(
                                  fontSize: screenWidth! / 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ))),
                  Expanded(
                      child: Container(
                          child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 30,
                        child: TextFormField(
                          controller: messageController,
                          style: TextStyle(fontSize: 20),
                          validator: (value) {
                            if (value == null || value == "") {
                              return "Enter message you want to send";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "  Enter message",
                              labelStyle: TextStyle(
                                  fontSize: screenWidth! / 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(child: Container())
                    ],
                  ))),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(flex: 7, child: Container()),
                                  Expanded(
                                      flex: 10,
                                      child: InkWell(
                                        onTap: () {
                                          _submit();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: const Color.fromRGBO(227, 88, 73, 1),
                                          child: Text(
                                            "SEND",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth! / 18),
                                          ),
                                        ),
                                      )),
                                  Expanded(child: Container()),
                                  Expanded(
                                      flex: 10,
                                      child: InkWell(
                                        onTap: () {
                                          nameController.text = "";
                                          mobileController.text = "";
                                          emailController.text = "";
                                          messageController.text = "";
                                          setState(() {});
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: const Color.fromRGBO(227, 88, 73, 1),
                                          child: Text(
                                            "CLEAR",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth! / 18),
                                          ),
                                        ),
                                      )),
                                  Expanded(flex: 7, child: Container()),
                                ],
                              )),
                          Expanded(child: Container()),
                        ],
                      )),
                ],
              ),
            )),
      ),
    );
  }

  Future<void> sendMessage() async {
    var response = await http.post(
        Uri.parse(
            "http://Api.aswdc.in/Api/TypingMasterGujarati/PostAppFeedback/AppPostFeedback"),
        headers: {
          "API_KEY": "1234"
        },
        body: <String, String?>{
          "AppName": "Typing Tutor Gujarati",
          "VersionNo": version,
          "Platform": "Google Play Store",
          "PersonName": nameController.text,
          "Mobile": mobileController.text,
          "Email": emailController.text,
          "Message": messageController.text,
          "Remarks": ""
        });
  }
}
