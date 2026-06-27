import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text("Scrollable Bottom",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blueAccent,),
      drawer: Drawer(),
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            child: Center(child: Text("HomeScreen",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder: (context,scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20),
                ),),
                child: ListView(
                  controller: scrollController,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Icon(CupertinoIcons.personalhotspot),
                        )
                      ],
                    )
                  ],
                ),
              );
              }
          )
        ],
      ),
    );
  }
}
