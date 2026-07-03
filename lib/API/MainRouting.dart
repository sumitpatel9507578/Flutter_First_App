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
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Home Screen", style: TextStyle(color: Colors.white)),
      ),
      drawer: const Drawer(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
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
                    offset: const Offset(3, 3),
                  )
                ],
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen()));
                  },
                  child: const Text("All Employee", style: TextStyle(color: Colors.white))),
            ),

            const SizedBox(height: 10),
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
                    offset: const Offset(3, 3),
                  )
                ],
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Singleemployee()));
                  },
                  child: const Text("Single Employee", style: TextStyle(color: Colors.white))),
            ),

            const SizedBox(height: 10),
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
                    offset: const Offset(3, 3),
                  )
                ],
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEmployee()));
                  },
                  child: const Text("Add Employee", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
