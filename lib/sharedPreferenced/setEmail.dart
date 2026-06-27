import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shoEmail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController eController = TextEditingController();

  Future<void> saveEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      "email",
      eController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text("Email Saved")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title:  Text(
          "Save Email",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
             SizedBox(height: 30),

            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: eController,
                textAlignVertical: TextAlignVertical.center,
                decoration:  InputDecoration(
                  hintText: "Enter Your Email",
                  border: InputBorder.none,

                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  prefixIcon: Icon(Icons.mail),

                ),
              ),
            ),

             SizedBox(height: 20),

            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                ),
                onPressed: () async {
                  await saveEmail();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ShowEmail(),
                    ),
                  );
                },
                child:  Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}