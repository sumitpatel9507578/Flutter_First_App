import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'update_userScreen.dart';
import 'data_controller.dart';

class UserScreen extends StatefulWidget {
  UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Provider",style: TextStyle(color: Colors.white),),),
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: Drawer(),
      body: Consumer<DataController>(
        builder: (BuildContext context, value, Widget? child) {
          return ListView.builder(
            itemCount: value.userName.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        value.deleteUser(value.userName[index]);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateUserscreen(
                              index: index,
                              oldName: value.userName[index],
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  child: Text(value.userName[index][0].toUpperCase()),
                ),
                title: Text("Name : ${value.userName[index]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nameController.clear();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add name"),
                    TextField(controller: nameController),
                    SizedBox(height: 10),
                    Consumer<DataController>(
                      builder: (BuildContext context, value, Widget? child) {
                        return ElevatedButton(
                          onPressed: () {
                            value.addUser(nameController.text);
                            Navigator.pop(context);
                          },
                          child: Text("Save"),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
