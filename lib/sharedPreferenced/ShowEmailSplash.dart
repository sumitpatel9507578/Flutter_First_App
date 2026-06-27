import 'dart:math';

import 'package:flutter/material.dart';
import 'package:second_app/sharedPreferenced/shoEmail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setEmail.dart';

class ShowemailsplashScreen extends StatefulWidget {
  const ShowemailsplashScreen({super.key});

  @override
  State<ShowemailsplashScreen> createState() => _ShowemailsplashScreenState();
}

class _ShowemailsplashScreenState extends State<ShowemailsplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
    print("==================================================email===============================================");

  }
  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString("email");
print("=========================================email===========================================================");
    print("$email");

    await Future.delayed( Duration(seconds: 4));

    if (email != null && email.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ShowEmail()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blueAccent,
        title: Text("SplashScreen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Center(child:  CircularProgressIndicator(),)
      ],
    ),
    );
  }
}
