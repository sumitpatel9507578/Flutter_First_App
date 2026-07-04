import 'package:flutter/material.dart';
import 'Post_Screen.dart';
import 'add_Employee.dart';
import 'singleEmployee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Home Screen", style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(

                  colors: [Colors.blueAccent,Colors.blue,Colors.purple],
                  stops: [
                    0.2,
                    0.5,
                    0.9,
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                  },
                  child: Text("All Employee", style: TextStyle(color: Colors.white))),
            ),

            SizedBox(height: 10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Singleemployee()));
                  },
                  child: Text("Single Employee", style: TextStyle(color: Colors.white))),
            ),

            SizedBox(height: 10),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(

                    colors: [Colors.blueAccent,Colors.blue,Colors.purple],
                stops: [
                  0.2,
                  0.5,
                  0.9,
                ],
                ),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3),
                  )
                ],
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployee()));
                  },
                  child: Text("Add Employee", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
