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
          else if(snapshot.hasData){
            final data=snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10,),
                            height: 830,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(data[index].image,fit: BoxFit.contain,width: double.infinity,height: 200,),
                                Text("Name: ${data[index].name}"),
                                Text("Age: ${data[index].age.toString()}"),
                                Text("Email: ${data[index].email}"),
                                Text("Phone: ${data[index].phone}"),
                                Text("Height: ${data[index].height}"),
                                Text("Weight: ${data[index].weight}"),
                                Text("EyeColour: ${data[index].eyeColor}"),
                                Text("Hair: ${data[index].hair}"),
                                Text("IP: ${data[index].ip}"),
                                Text("Address: ${data[index].address}"),
                                Text("Coordinate: ${data[index].coordinates}"),
                                Text("MakAddress: ${data[index].macAddress}"),
                                Text("University: ${data[index].university}"),
                                Text("Bank: ${data[index].bank}"),
                                Text("Company: ${data[index].company}"),
                                Text("Company Address: ${data[index].companyAddress}"),
                                Text("Company Coordinate:${data[index].ssn}"),
                                Text("EIN: ${data[index].ein}"),
                                Text("SSN: ${data[index].ssn}"),
                                Text("Agent: ${data[index].userAgent}"),
                                Text("Crypto: ${data[index].crypto}"),
                                Text("Role: ${data[index].role}"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                );

              },);

          }
          else{
            return Center(
              child: Text("My List is Empty"),
            );
          }

        },),
    );
  }
}
