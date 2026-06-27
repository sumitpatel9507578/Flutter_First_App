import 'package:flutter/material.dart';
import 'package:second_app/Form/showData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FormApply.dart';
import 'SplashScreen.dart';


void main() {
  runApp( MyRoute());
}

class MyRoute extends StatefulWidget {
  const MyRoute({super.key});

  @override
  State<MyRoute> createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  bool isLogin = false;
  bool isRegistered = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Splashscreen(),
      routes: {
        "/reg":(context)=>RegisterScreen(),
        "/profile": (context) => ProfileScreen(),
      },
    );
  }
}