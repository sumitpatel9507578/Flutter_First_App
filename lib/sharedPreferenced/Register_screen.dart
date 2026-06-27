import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
TextEditingController nameController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();
TextEditingController repasswordController=TextEditingController();

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
    repasswordController.clear();
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
                Stack(
                  children: [

                    CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person,color: Colors.deepPurpleAccent,size: 70,),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 14,
                        child: Icon(CupertinoIcons.plus,color: Colors.deepPurpleAccent,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  TextField(
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
                    decoration: InputDecoration(hintText: "Enter Your Email",border: InputBorder.none,contentPadding: EdgeInsets.symmetric(horizontal: 15),prefixIcon: Icon(Icons.mail,color: Colors.grey,)),controller: emailController,textAlignVertical: TextAlignVertical.center,
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
                      border: Border.all(color: Colors.grey,width: 2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:  TextField(
                    decoration: InputDecoration(
                        hintText: "Verify Your Password",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        prefixIcon: Icon(CupertinoIcons.lock_fill,color: Colors.grey,),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            isConfirmPasswordHide=!isConfirmPasswordHide;
                          });
                        }, icon: Icon(isConfirmPasswordHide?CupertinoIcons.eye_slash_fill:CupertinoIcons.eye_fill))),
                    controller: repasswordController,textAlignVertical: TextAlignVertical.center,obscureText: isConfirmPasswordHide,
                  ),
                ),
                SizedBox(height: 20,),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                      ),
                      onPressed: () async {
                        if(nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || repasswordController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please Fill The Data"),
                            ),
                          );
                          return;
                        }
                        if(passwordController.text!=repasswordController.text){
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Password Not Matched"),
                            ),
                          );
                        }
                        SharedPreferences prefs=await SharedPreferences.getInstance();
                        await prefs.setString("name", nameController.text);
                        await prefs.setString("email", emailController.text);
                        await prefs.setString("password", passwordController.text);
                        await prefs.setBool("isRegistered", true);
                        Navigator.pushReplacementNamed(context, "/Log");
                      }, child: Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
