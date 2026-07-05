import 'package:flutter/material.dart';

class Allfieldupdate extends StatefulWidget {
  const Allfieldupdate({super.key});

  @override
  State<Allfieldupdate> createState() => _AllfieldupdateState();
}

class _AllfieldupdateState extends State<Allfieldupdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("All Fields Update",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
