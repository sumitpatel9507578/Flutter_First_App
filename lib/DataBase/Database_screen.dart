import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'DataBase_Provider.dart';
import 'showDataScreen.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  final picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final img = await picker.pickImage(source: source);
    if (img != null) {
      context.read<UserProvider>().setImage(File(img.path));
    }
  }

  void showPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Image"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              pickImage(ImageSource.camera);
            },
            child: const Text("Camera"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              pickImage(ImageSource.gallery);
            },
            child: const Text("Gallery"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Add User")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Consumer<UserProvider>(
              builder: (_, p, __) {
                return CircleAvatar(
                  radius: 50,
                  backgroundImage: p.imageFile != null
                      ? FileImage(p.imageFile!)
                      : null,
                  child: p.imageFile == null
                      ? const Icon(Icons.person)
                      : null,
                );
              },
            ),

            TextButton(
              onPressed: showPicker,
              child: const Text("Pick Image"),
            ),

            textField(nameController, "Name"),
            textField(emailController, "Email"),
            textField(phoneController, "Phone"),
            textField(passController, "Password"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await provider.addUser(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  password: passController.text,
                  image: provider.imageFile?.path ?? "",
                );

                nameController.clear();
                emailController.clear();
                phoneController.clear();
                passController.clear();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Showdatascreen(),
                  ),
                );
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(TextEditingController c, String hint) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: c,
        decoration: InputDecoration(labelText: hint),
      ),
    );
  }
}