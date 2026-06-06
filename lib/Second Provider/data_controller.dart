import 'package:flutter/cupertino.dart';

class DataController extends ChangeNotifier {

  List<String> _userName=["Mahfooz","Ankit","Sumit","Anjali","Supriya","Arun"];

  List<String> get userName=>_userName;

  void addUser(String name){
    _userName.add(name);
    print("User Added : $name");
    notifyListeners(  );
  }

  // void deleteUser(int index){
  //   _userName.removeAt(index);
  //   notifyListeners();
  //   print("User Deleted Successfully");
  // }

  void deleteUser(String name){
    _userName.remove(name);
    notifyListeners();
    print("User Deleted Successfully");
  }
  void updateUser(String newName,int index){
    _userName[index]=newName;
    notifyListeners();
    print("User Updated Successfully");
  }
}