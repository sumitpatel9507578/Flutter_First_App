import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_controller.dart';

class UpdateUserscreen extends StatefulWidget {
  final int index;
  final String oldName;

  const UpdateUserscreen({
    super.key,
    required this.index,
    required this.oldName,
  });

  @override
  State<UpdateUserscreen> createState() => _UpdateUserscreenState();
}

class _UpdateUserscreenState extends State<UpdateUserscreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.oldName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<DataController>().updateUser(
                  nameController.text,
                  widget.index,
                );

                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}