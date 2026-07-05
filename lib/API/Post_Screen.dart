// import 'package:flutter/cupertino.dart';
//
// import 'rest_api_helper.dart';
// import 'Rest_api.dart';
// import 'package:flutter/material.dart';
//
// class PostScreen extends StatelessWidget {
//   const PostScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     RestApiHelper apiHelper=RestApiHelper();
//
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.blue,
//         title: Text("REST API",style: TextStyle(color: Colors.white),),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     child: Icon(Icons.person,size: 35,),
//                   ),
//                   SizedBox(height: 10,),
//                   Text("Sumit Patel",style: TextStyle(color: Colors.white),),
//                   Text("sumit@gmail.com",style: TextStyle(color: Colors.white),),
//                 ],
//               ),
//             ),
//             ListTile(leading: Icon(CupertinoIcons.home),title: Text("Home"),onTap: (){Navigator.pop(context);},),
//             ListTile(leading: Icon(CupertinoIcons.shopping_cart),title: Text("Product"),onTap: (){Navigator.pop(context);},),
//             ListTile(leading: Icon(CupertinoIcons.square_favorites),title: Text("WishList"),onTap: (){Navigator.pop(context);},),
//             ListTile(leading: Icon(CupertinoIcons.settings),title: Text("Setting"),onTap: (){Navigator.pop(context);},),
//           ],
//         ),
//       ),
//       body: FutureBuilder(
//         future: apiHelper.fetchProducts(),
//         builder: (BuildContext context, AsyncSnapshot<List<productsModal>> snapshot) {
//           if(snapshot.connectionState==ConnectionState.waiting){
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           else if(snapshot.hasError){
//             return Center(
//               child: Text("Errors: ${snapshot.error}"),
//             );
//           }
//           else if(snapshot.hasData){
//             final data=snapshot.data;
//             return ListView.builder(
//               itemCount: data!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                     padding: EdgeInsets.all(10),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.only(left: 10,),
//                             width: 350,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Image.network(data[index].image,fit: BoxFit.contain,width: double.infinity,height: 200,),
//                                 Text("Name: ${data[index].name}"),
//                                 Text("Age: ${data[index].age.toString()}"),
//                                 Text("Email: ${data[index].email}"),
//                                 Text("Phone: ${data[index].phone}"),
//                                 Text("Height: ${data[index].height}"),
//                                 Text("Weight: ${data[index].weight}"),
//                                 ExpansionTile(
//                                   expandedCrossAxisAlignment: CrossAxisAlignment.start,
//                                     title: Text("More Details",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//                                   childrenPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//                                   children: [
//                                     Text("EyeColour: ${data[index].eyeColor}"),
//                                     Divider(),
//                                     Text("Hair: ${data[index].hair}"),
//                                     Divider(),
//                                     Text("IP: ${data[index].ip}"),
//                                     Divider(),
//                                     Text("Address: ${data[index].address}"),
//                                     Divider(),
//                                     Text("Coordinate: ${data[index].coordinates}"),
//                                     Divider(),
//                                     Text("MakAddress: ${data[index].macAddress}"),
//                                     Divider(),
//                                     Text("University: ${data[index].university}"),
//                                     Divider(),
//                                     Text("Bank: ${data[index].bank}"),
//                                     Divider(),
//                                     Text("Company: ${data[index].company}"),
//                                     Divider(),
//                                     Text("Company Address: ${data[index].companyAddress}"),
//                                     Divider(),
//                                     Text("Company Coordinate:${data[index].ssn}"),
//                                     Divider(),
//                                     Text("EIN: ${data[index].ein}"),
//                                     Divider(),
//                                     Text("SSN: ${data[index].ssn}"),
//                                     Divider(),
//                                     Text("Agent: ${data[index].userAgent}"),
//                                     Divider(),
//                                     Text("Crypto: ${data[index].crypto}"),
//                                     Divider(),
//                                     Text("Role: ${data[index].role}"),
//                                     Divider(),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                 );
//               },);
//           }
//           else{
//             return Center(
//               child: Text("My List is Empty"),
//             );
//           }
//         },),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
//
// import 'rest_api_helper.dart';
// import 'Rest_api.dart';
// import 'package:flutter/material.dart';
//
// class PostScreen extends StatelessWidget {
//   const PostScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     RestApiHelper apiHelper=RestApiHelper();
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.blue,
//         title: Text("REST API",style: TextStyle(color: Colors.white),),
//         actions: [
//           Icon(Icons.more_vert),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     child: Icon(Icons.person,size: 35,),
//                   ),
//                   SizedBox(height: 10,),
//                   Text("Sumit Patel",style: TextStyle(color: Colors.white),),
//                   Text("sumit@gmail.com",style: TextStyle(color: Colors.white),),
//                 ],
//               ),
//             ),
//             ListTile(leading: Icon(CupertinoIcons.home),title: Text("Home"),onTap: (){Navigator.pop(context);},),
//             ListTile(leading: Icon(CupertinoIcons.shopping_cart),title: Text("Product"),onTap: (){Navigator.pop(context);},),
//             ListTile(leading: Icon(CupertinoIcons.square_favorites),title: Text("WishList"),onTap: (){Navigator.pop(context);},),
//             ListTile(leading: Icon(CupertinoIcons.settings),title: Text("Setting"),onTap: (){Navigator.pop(context);},),
//           ],
//         ),
//       ),
//       body: FutureBuilder<productsModal>(
//         future: apiHelper.fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }
//
//           if (!snapshot.hasData) {
//             return  Center(
//               child: Text("No Data"),
//             );
//           }
//
//           final users = snapshot.data!.data.users;
//
//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               final user = users[index];
//
//               return Card(
//                 margin:  EdgeInsets.all(10),
//                 child: Padding(
//                   padding:  EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Name: ${user.fullName}",style: TextStyle(fontWeight: FontWeight.bold),),
//                       Text("Email: ${user.email ?? ""}"),
//                       Text("Phone: ${user.mobile}"),
//                       Text("Company: ${user.companyName ?? ""}"),
//                       Text("Role: ${user.roleName}"),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       )
//     );
//   }
// }mport 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Rest_api.dart';
import 'SingleFieldupdate.dart';
import 'rest_api_helper.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  RestApiHelper apiHelper = RestApiHelper();
  late Future<ProductsModel> productsFuture;
  @override
  void initState() {
    super.initState();
    productsFuture = apiHelper.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "REST API",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 35),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sumit Patel",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "sumit@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.shopping_cart),
              title: const Text("Product"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.square_favorites),
              title: const Text("WishList"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text("Setting"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: FutureBuilder<ProductsModel>(
        future: apiHelper.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return  Center(
              child: Text("No Data"),
            );
          }

          final users = snapshot.data!.data;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Card(
                margin:  EdgeInsets.all(10),
                child: Padding(
                  padding:  EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${user.empName}",
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(user.empId.toString()),
                      Text("Email: ${user.empEmail ?? ""}"),
                      Text("Phone: ${user.empPhone}"),
                      Text("DepartMent: ${user.empDepartment ?? ""}"),
                      Text("Salary: ${user.empSalary}"),
                      IconButton(
                        onPressed: () async {
                          final isDeleted =
                          await apiHelper.deleteEmployeeById(user.empId);
                          print("Employee Id: ${user.empId} ====================================================");

                          setState(() {
                            isDeleted;
                            Fluttertoast.showToast(msg: "Employee Deleted Successfully");

                          });
                        },
                        icon:  Icon(Icons.delete,color: Colors.red,),
                      ),
                      IconButton(onPressed: () async{
                        final result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>EditEmployeeScreen(user: user,)));
                        if(result==true){
                          setState(() {
                            productsFuture=apiHelper.fetchProducts();
                          });
                        }
                      }, icon: Icon(Icons.edit,color: Colors.blue,))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}