import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setEmail.dart';

class ShowEmail extends StatefulWidget {
  const ShowEmail({super.key});

  @override
  State<ShowEmail> createState() => _ShowEmailState();
}

class _ShowEmailState extends State<ShowEmail> {
  String email = "";

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  Future<void> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      email = prefs.getString("email") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
          }, icon: Icon(Icons.arrow_back)),
          title:  Text("Show Email")),
      body: Center(
        child: Text(
          email,
          style:  TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}