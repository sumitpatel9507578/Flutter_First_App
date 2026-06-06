import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Counter.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white70),
        backgroundColor: Colors.black,
        title: Text("COUNTER",
          style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24
          ),),
      actions: [
       Consumer<CounterHelper>(builder: (BuildContext context, value, Widget? child) {
         return Row(
           children: [
             GestureDetector(
               onTap: (){
                 value.reset();
               },
               child: Row(
                 children: [
                   Icon(Icons.refresh,color: Colors.white,),
                   Text("Reset",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                 ],
               ),
             )
           ],
         );
       },)
      ],
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Consumer<CounterHelper>(
              builder: (BuildContext context, value, Widget? child) {
                return Column(
                  children: [
                    Text("Count:", style: TextStyle(fontSize: 30,color: Colors.white),),
                    Text("${value.counter}",style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 130),)
                  ],
                );
              },),
            Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Consumer<CounterHelper>(builder: (BuildContext context, value, Widget? child) {
                  return Column(
                    children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                    radius: 30,
                    child: IconButton(onPressed: (){
                      value.decrement();
                    }, icon: Icon(Icons.remove,color: Colors.white,)),
                  ),
                      SizedBox(height: 10,),
                      Text("DECREAMENT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  );
                },),
                SizedBox(width: 20,),
                Consumer<CounterHelper>(builder: (BuildContext context, value, Widget? child) {
                  return Column(
                    children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: IconButton(onPressed: (){
                      value.increment();
                    }, icon: Icon(Icons.add,color: Colors.white,),),

                  ),
                      SizedBox(height: 10,),
                      Text("INCREAMENT",style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),)
                    ],
                  );
                },),
                SizedBox(width: 20,),
                Consumer<CounterHelper>(builder: (BuildContext context, value, Widget? child) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child: IconButton(onPressed: (){
                          value.tenIncreament();
                        }, icon: Text("+10",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(height: 10,),
                      Text("ADD 10",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  );
                },)
              ],
            )
          ],

        ),
      ),
    );
  }
}