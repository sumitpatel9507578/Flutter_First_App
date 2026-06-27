import 'dart:io';
import 'package:flutter/material.dart';
import 'Database.dart';

class UserProvider extends ChangeNotifier {
  List<Map<String, dynamic>> users = [];
  File? imageFile;

  void setImage(File file) {
    imageFile = file;
    notifyListeners();
  }

  void clearImage() {
    imageFile = null;
    notifyListeners();
  }

  Future<void> getUsers() async {
    users = await DBhelper().getUsers();
    notifyListeners();
  }

  Future<int> addUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String image,
  }) async {
    final db = await DBhelper().database;

    return await db.insert("users", {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "image": image,
    });
  }

  Future<void> deleteUser(int id) async {
    await DBhelper().deleteUser(id);
    await getUsers();
  }
  Future<void> updateUser({
    required int id,
    required String name,
    required String email,
  required String phone,
  required String password,
  required String image,
  }) async{
    await DBhelper().updateUser(id: id,
        name: name,
        email: email,
        phone: phone,
        password: password,
        image: image);
    await getUsers();
  }
}