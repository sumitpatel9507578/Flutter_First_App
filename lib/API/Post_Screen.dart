import 'package:flutter/cupertino.dart';

import 'rest_api_helper.dart';
import 'Rest_api.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestApiHelper apiHelper=RestApiHelper();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text("REST API",style: TextStyle(color: Colors.white),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person,size: 35,),
                  ),
                  SizedBox(height: 10,),
                  Text("Sumit Patel",style: TextStyle(color: Colors.white),),
                  Text("sumit@gmail.com",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
            ListTile(leading: Icon(CupertinoIcons.home),title: Text("Home"),onTap: (){Navigator.pop(context);},),
            ListTile(leading: Icon(CupertinoIcons.shopping_cart),title: Text("Product"),onTap: (){Navigator.pop(context);},),
            ListTile(leading: Icon(CupertinoIcons.square_favorites),title: Text("WishList"),onTap: (){Navigator.pop(context);},),
            ListTile(leading: Icon(CupertinoIcons.settings),title: Text("Setting"),onTap: (){Navigator.pop(context);},),
          ],
        ),
      ),
      body: FutureBuilder(
        future: apiHelper.fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<productsModal>> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError){
            return Center(
              child: Text("Errors: ${snapshot.error}"),
            );
          }

          final users = snapshot.data!.data.users;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${user.fullName}"),
                      Text("Email: ${user.email ?? ""}"),
                      Text("Phone: ${user.mobile}"),
                      Text("Company: ${user.companyName ?? ""}"),
                      Text("Role: ${user.roleName}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      )
    );
  }
}
