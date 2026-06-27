import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<Map<String, dynamic>> a = [
    {
      "Title": "Bank Account",
      "subtitle": "2 Bank Account",
      "icon": Icons.home,
    },
    {
      "Title": "Rupay Credit",
      "subtitle": "Pay With Upi",
      "icon": Icons.credit_card,
    },
    {
      "Title": "UPI lite",
      "subtitle": "Pay Pin Free",
      "icon": FontAwesomeIcons.rupiahSign,
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/img_1.png"),fit: BoxFit.cover)
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         SizedBox(width: 370,),
                         Icon(Icons.more_vert),

                       ],
                     ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        SizedBox(width: 40,),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Sumit Kumar",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                           Text("UPI ID: sumitpatel3030-1@ok",style: TextStyle(color: Colors.black,fontSize: 15),),
                           Text("hdfcbank",style: TextStyle(color: Colors.black,fontSize: 15),),
                           SizedBox(height: 10,),
                           Text("9631049569",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                         ],
                       ),
                        SizedBox(height: 50,width: 40,),
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage("assets/images/Marvel.png"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,

                              child: CircleAvatar(radius: 20,child: Icon(Icons.qr_code_scanner,size: 20,
                              ),),),

                          ],
                        )
                      ],
                    ),

                    ],
                  ),
                ),
               Container(
                 padding: EdgeInsets.all(10),
                 alignment: Alignment.topLeft,
                 height: 1000,
                 width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 2
                    )
                  ]
                ),
                 child: Column(
                   children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(

                        height: 80,
                        width: 190,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child:  Card(
                            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Colors.orange,
                            child: Center(
                              child: ListTile(
                                leading: FaIcon(FontAwesomeIcons.trophy,color: Colors.amber,size: 25,),
                                title: Text("₹ 108",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                                subtitle: Text("Rewards Earned",style: TextStyle(color: Colors.amber,fontSize: 13,fontWeight: FontWeight.bold),),

                              ),
                            )
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 190,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child:  Card(
                            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: Colors.blue,
                            child: Center(
                              child: ListTile(
                                leading: FaIcon(FontAwesomeIcons.peopleGroup,color: Colors.lightBlueAccent,size: 25,),
                                title: Text("₹ 108",style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
                                subtitle: Text("Refer A Friend",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15,fontWeight: FontWeight.bold),),

                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                     SizedBox(height: 20,),
                     Container(
                       padding: EdgeInsets.all(10),
                       height: 150,
                       width: 360,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(20)
                    ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                        Row(
                          children: [
                            Icon(Icons.mobile_friendly,size: 50,color: Colors.black,),
                            SizedBox(width: 20,),
                            Text("Receive Money On Google Pay\n Any Upi app",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
                          ],
                        ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child:  Padding(padding: EdgeInsets.only(left: 70,top: 20),child: Text("Allow",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),),
                          )
                         ],
                       ),
                     ),
                     SizedBox(height: 20,),
                     Container(
                       alignment: Alignment.topLeft,
                       padding: EdgeInsets.all(20),
                       height: 300,
                       width: 380,
                       decoration: BoxDecoration(
                         color: Colors.white38,
                         borderRadius: BorderRadius.circular(20)
                       ),
                       child: Column(
                         children: [
                         Row(
                           children: [
                             Text("Set up payment methods 1/3",style: TextStyle(fontSize: 18),),
                             SizedBox(width: 70,),
                             Icon(Icons.arrow_forward_ios)
                           ],
                         ),
                           SizedBox(
                             height: 180,
                             child: GridView.builder(
                               physics: NeverScrollableScrollPhysics(),
                                 itemCount: a.length,
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 3,
                                   childAspectRatio: 0.7,
                                 ),
                                 itemBuilder: (context, index) {
                                   final item = a[index];

                                   return Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       CircleAvatar(
                                         radius: 35,
                                         backgroundColor: Colors.blue.shade800,
                                         child: Icon(
                                           item["icon"],
                                           color: Colors.white,
                                           size: 30,
                                         ),
                                       ),

                                       const SizedBox(height: 10),

                                       Text(
                                         item["Title"],
                                         textAlign: TextAlign.center,
                                         style: const TextStyle(
                                           color: Colors.black,
                                           fontSize: 15,
                                         ),
                                       ),

                                       Text(
                                         item["subtitle"],
                                         textAlign: TextAlign.center,
                                         style: const TextStyle(
                                           color: Colors.grey,
                                           fontSize: 12,
                                         ),
                                       ),
                                     ],
                                   );
                                 }
                             )
                           )
                         ],
                       ),
                     )

                   ],
                 ),
               )

              ],
            ),
        )
        ],
      ),
    );
  }
}
