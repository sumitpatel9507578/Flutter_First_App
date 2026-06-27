import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_app/Form/showData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
TextEditingController nameController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController phoneController=TextEditingController();
TextEditingController passwordController=TextEditingController();

Future<void> registerUser() async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.setBool("isRegistered", true);

  await prefs.setString("name", nameController.text);
  await prefs.setString("email", emailController.text);
  await prefs.setString("password", passwordController.text);
  await prefs.setString("date", "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}");
  print("Date Saved Successfully");
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordHide = false;
  bool isConfirmPasswordHide = false;
  @override
  void initState() {
    super.initState();

    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Create Account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.arrow_back,color: Colors.white,),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(

              children: [
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  TextField(
                    textCapitalization: TextCapitalization.characters,
                    inputFormatters: [UpperCaseTextFormatter()],
                    decoration: InputDecoration(hintText: "Enter Your Name",border: InputBorder.none,contentPadding: EdgeInsets.symmetric(horizontal: 15),prefixIcon: Icon(Icons.person,color: Colors.grey,)),controller: nameController,textAlignVertical: TextAlignVertical.center,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Enter Your Email",border: InputBorder.none,contentPadding: EdgeInsets.symmetric(horizontal: 15),prefixIcon: Icon(Icons.mail,color: Colors.grey,)),controller: emailController,textAlignVertical: TextAlignVertical.center,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                        hintText: "Enter Your Phone Number",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        prefixIcon: Icon(Icons.phone,color: Colors.grey,)),
                    controller: phoneController,
                    textAlignVertical: TextAlignVertical.center,keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        prefixIcon: Icon(CupertinoIcons.lock_fill,color: Colors.grey,),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            isPasswordHide=!isPasswordHide;
                          });
                        }, icon: Icon(isPasswordHide?CupertinoIcons.eye_slash_fill:CupertinoIcons.eye_fill))),
                    controller: passwordController,textAlignVertical: TextAlignVertical.center,obscureText: isPasswordHide,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      onPressed: () async {

                        String name = nameController.text.trim();
                        String email = emailController.text.trim();
                        String phone = phoneController.text.trim();
                        String password = passwordController.text.trim();

                        if (name.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter Name");
                          return;
                        }

                        if (email.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter Email");
                          return;
                        }

                        if (phone.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter Phone");
                          return;
                        }

                        if (password.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter Password");
                          return;
                        }
                        if (!RegExp(r'^[6-9][0-9]{9}$').hasMatch(phone)) {
                          Fluttertoast.showToast(
                            msg: "Phone must start with 6, 7, 8 or 9 and be 10 digits",
                          );
                          return;
                        }

                        if (!RegExp(r'^[56][0-9]{9}$').hasMatch(phone)) {
                          await  Fluttertoast.showToast(msg: "Enter Valid phone");
                          await Future.delayed(Duration(milliseconds: 800));
                          return;
                        };

                        if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(email)) {
                        await  Fluttertoast.showToast(msg: "Enter Valid Email");
                        await Future.delayed(Duration(milliseconds: 800));
                        return;
                        };

                        if (!RegExp(r'[A-Z]').hasMatch(password)) {

                          await  Fluttertoast.showToast(msg: "Enter a upper case");
                          await Future.delayed(Duration(milliseconds: 800));
                          return;
                        };
                        if (!RegExp(r'[a-z]').hasMatch(password)) {

                          await  Fluttertoast.showToast(msg: "Enter a lower case");
                          await Future.delayed(Duration(milliseconds: 800));
                          return;
                        };
                        if (!RegExp(r'[0-9]').hasMatch(password)) {

                          await  Fluttertoast.showToast(msg: "Enter a number");
                          await Future.delayed(Duration(milliseconds: 800));
                          return;
                        };
                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
                          await  Fluttertoast.showToast(msg: "Enter a special character");
                          await Future.delayed(Duration(milliseconds: 800));
                          return;
                        };

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString("name", name);
                        await prefs.setString("email", email);
                        await prefs.setString("phone", phone);
                        await prefs.setString("password", password);
                        await prefs.setBool("isRegistered", true);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()),
                        );
                      }, child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
