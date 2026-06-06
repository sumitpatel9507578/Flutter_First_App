import 'package:flutter/material.dart';
import 'showName.dart';
// import 'Counter.dart';
// import 'CounterScreen.dart';
import 'package:provider/provider.dart';

import 'data_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: UserScreen(),
    );
  }
}