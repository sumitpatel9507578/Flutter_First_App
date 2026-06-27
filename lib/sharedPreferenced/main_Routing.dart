import 'package:flutter/material.dart';
import 'package:second_app/sharedPreferenced/SplashScreen.dart';
import 'Login_Screen.dart';
import 'Register_screen.dart';
import 'Profile_Screen.dart';

void main() {
  runApp(const MyRoute());
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
        "/Log": (context) => LoginScreen(),
        "/Profile": (context) => ProfileScreen(),
      },
    );
  }
}