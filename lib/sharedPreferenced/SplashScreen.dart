import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }
  Future<void> checkUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    bool isReg=prefs.getBool("isRegistered")??false;
    bool isLogin=prefs.getBool("isLogin")??false;
    await Future.delayed(Duration(seconds: 4));
    if(isLogin){
      Navigator.pushReplacementNamed(context, "/Profile");
    }
    else if(isReg){
      Navigator.pushReplacementNamed(context, "/Log");
    }
    else{
      Navigator.pushReplacementNamed(context, "/reg");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("SplashScreen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
