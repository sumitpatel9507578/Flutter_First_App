import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_app/sharedPreferenced/Register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
const String loginKey = "isLogin";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isHide=true;

  Future<void> loginuser() async {

    SharedPreferences prefs =
    await SharedPreferences.getInstance();

    String email =
        prefs.getString("email") ?? "";

    String password =
        prefs.getString("password") ?? "";

    if(emailController.text.isEmpty||passwordController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill Data")));
      return;
    }

    if (emailController.text == email &&
        passwordController.text == password) {

      await prefs.setBool("isLogin", true);

      Navigator.pushReplacementNamed(
        context,
        "/Profile",
      );

    } else {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Invalid Email or Password",
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Login",style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.pushReplacementNamed(context, "/reg");
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person,color: Colors.blueAccent,size: 60,),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey,width: 2)
                  ),
                  child: TextField(
                    controller: emailController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.mail),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15,)
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey,width: 2)
                  ),
                  child: TextField(
                    controller: passwordController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(CupertinoIcons.eye_fill),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15,

                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text("ForGot Password?",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),

                Container(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: (){
                      loginuser();
                    },
                    child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",),
                    TextButton(onPressed: (){
                      Navigator
                          .pushReplacement(context, MaterialPageRoute(builder: (_)=> RegisterScreen(),),);
                    }, child: Text("Register"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
