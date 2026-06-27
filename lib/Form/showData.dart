import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FormApply.dart';

bool isLogin = false;
bool isRegistered = false;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> getData() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      name=prefs.getString("name")??"";
      email=prefs.getString("email")??"";
      phone=prefs.getString("phone")??"";
    });
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("isLogin", false);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) =>  RegisterScreen(),
      ),
          (route) => false,
    );
  }
  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool login = prefs.getBool("isLogin") ?? false;
    bool registered = prefs.getBool("isRegistered") ?? false;
    
  }

  String name="";
  String email="";
  String phone="";
  @override
  void initState() {
    super.initState();
    getData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        actions: [
          Icon(Icons.edit,color: Colors.white,),

          SizedBox(width: 15,)
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person,color: Colors.green,size: 70,),
                ),
                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Full Name"),
                  subtitle: Text(name),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Phone"),
                  subtitle: Text("$phone"),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text("Email"),
                  subtitle: Text(email),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
