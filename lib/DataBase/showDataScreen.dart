import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/Form/FormApply.dart';
import 'DataBase_Provider.dart';
import 'Database_screen.dart';

class Showdatascreen extends StatefulWidget {
  const Showdatascreen({super.key});

  @override
  State<Showdatascreen> createState() => _ShowdatascreenState();
}

class _ShowdatascreenState extends State<Showdatascreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: provider.users.isEmpty
          ? const Center(child: Text("No Data Found"))
          : ListView.builder(
        itemCount: provider.users.length,
        itemBuilder: (context, index) {
          final user = provider.users[index];

          return ListTile(
            title: Text(user["name"] ?? ""),
            subtitle: Text(user["email"] ?? ""),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    provider.deleteUser(user["id"]);
                  },
                ),
              ],
            ),
            leading: CircleAvatar(
              backgroundImage:
              user["image"] != null && user["image"].toString().isNotEmpty
                  ? FileImage(File(user["image"]))
                  : null,
              child: (user["image"] == null || user["image"].toString().isEmpty)
                  ? const Icon(Icons.person)
                  : null,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DatabaseScreen(),
            ),
          );
        },
        child:  Icon(Icons.add),
      ),
    );
  }
}