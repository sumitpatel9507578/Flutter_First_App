import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_Screen.dart';
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
      print(prefs.getString("date"));
      name=prefs.getString("name")??"";
      email=prefs.getString("email")??"";
      date=prefs.getString("date")??"12/12/2024";
    });
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("isLogin", false);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) =>  LoginScreen(),
      ),
          (route) => false,
    );
  }
  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool login = prefs.getBool("isLogin") ?? false;
    bool registered = prefs.getBool("isRegistered") ?? false;

    setState(() {
      isLogin = login;
      isRegistered = registered;
    });
  }

  String name="";
  String email="";
  String phone="";
  String date="";
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
         Navigator.pushReplacementNamed(context, "/Log");
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
                  subtitle: Text("919631049569"),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text("Email"),
                  subtitle: Text(email),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text("Member Since"),
                  subtitle: Text(date,style: TextStyle(color: Colors.black),),
                ),
                Divider(),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))
                      ),
                      onPressed: logout, child: Text("Log Out",style: TextStyle(color: Colors.white),)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
