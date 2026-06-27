import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool isCheck=false;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(

              height: 300,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(2, 2)
                  )
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      TextField(
                        decoration:
                        InputDecoration(
                          hintText: "UserName",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,

                        )
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextField(
                      decoration: InputDecoration(
                        hintText: "PassWord",
                        hintStyle: TextStyle(
                          color: Colors.grey
                        )
                      ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck,
                              onChanged: (value) {
                                setState(() {
                                  isCheck=value!;
                                });
                              },
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                              ),
                          Text("Keep me Signed in",style: TextStyle(color: Colors.blue,fontSize: 14),)
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(width: 190,),
                          Text("Forgot PassWord?",style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
