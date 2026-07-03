import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/API/MainRouting.dart';
import 'DataBase/DataBase_Provider.dart';
import 'DataBase/Database.dart';
import 'DataBase/showDataScreen.dart';
import 'API/Post_Screen.dart';
import 'Post/add_PostScree.dart';
import 'API/MainRouting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBhelper().database;

  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider()..getUsers(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
      home:  HomeScreen(),
    );
  }
}
