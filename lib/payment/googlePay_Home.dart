import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Profile")),
  ];

  @override
  List<Map<String, dynamic>> people = [
    {"name": "Pocket Money", "icon": Icons.handshake,"color":Colors.orange},
    {"name": "Nanhak", "letter": "N","color":Colors.blue},
    {"name": "Self Transfer", "icon": Icons.person_pin,"color":Colors.orange},
    {"name": "Mr Manoj", "letter": "M","color":Colors.amber},
    {"name": "Aman", "letter": "A","color":Colors.purple},
    {"name": "Nanhak", "letter": "N","color":Colors.pink},
    {"name": "Mr Manoj", "letter": "M","color":Colors.cyan},
    {"name": "More", "icon": Icons.keyboard_arrow_down,"color":Colors.yellow},
  ];

  Widget quickAction(IconData icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blue.shade800,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30,),
                     Container(
                       width: 300,
                       height: 50,
                       child:  TextField(
                         decoration: InputDecoration(
                           filled: true,
                           fillColor: Colors.black,
                           hintText: "Pay AnyOne On UPi",
                           hoverColor: Colors.blue,
                           hintStyle: TextStyle(
                               color: Colors.white
                           ),
                           prefixIcon: Icon(Icons.search,color: Colors.white,),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30),
                             borderSide: BorderSide.none,
                           ),
                         ),
                       ),
                     ),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                          "assets/images/Marvel.png",
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 580,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [

                         quickAction(Icons.qr_code_scanner, "Scan any\nQR code"),
                         quickAction(Icons.currency_rupee, "Pay\nanyone"),
                         quickAction(Icons.account_balance, "Bank\ntransfer"),
                         quickAction(Icons.phone_android, "Mobile\nrecharge"),
                       ],
                     ),
                      SizedBox(height: 30,),
                     SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child:  Row(
                         children: [

                           SizedBox(
                             height: 70,
                             width: 130,
                             child: Container(
                               alignment: Alignment.centerLeft,
                               decoration: BoxDecoration(
                                   border: Border.all(color: Colors.white,width: 2),
                                   borderRadius: BorderRadius.circular(50),
                                   color: Colors.transparent
                               ),
                               child: Card(
                                 color: Colors.transparent,
                                 child: ListTile(
                                   dense: true,
                                   visualDensity: VisualDensity.compact,
                                   contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                   leading: CircleAvatar(
                                     radius: 17,
                                     child: Icon(Icons.rocket_launch),
                                   ),
                                   title: Text("UPI Lite",style: TextStyle(fontSize: 13,color: Colors.white),),
                                   subtitle: Text("Acitvate",style: TextStyle(color: Colors.blue,fontSize: 10),),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(width: 10,),
                           SizedBox(
                             height: 70,
                             width: 130,
                             child: Container(
                               alignment: Alignment.centerLeft,
                               decoration: BoxDecoration(
                                   border: Border.all(color: Colors.white,width: 2),
                                   borderRadius: BorderRadius.circular(50),
                                   color: Colors.transparent
                               ),
                               child: Card(
                                 color: Colors.transparent,
                                 child: ListTile(
                                   dense: true,
                                   visualDensity: VisualDensity.compact,
                                   contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                   leading: CircleAvatar(
                                     radius: 17,
                                     child: FaIcon(FontAwesomeIcons.trophy,color: Colors.amber,),
                                   ),
                                   title: Text("Rewards",style: TextStyle(color: Colors.white,fontSize: 10),),
                                   subtitle: Text("₹180",style: TextStyle(color: Colors.white,fontSize: 10),),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(width: 10,),
                           SizedBox(
                             height: 70,
                             width: 130,
                             child: Container(
                               alignment: Alignment.centerLeft,
                               decoration: BoxDecoration(
                                   border: Border.all(color: Colors.white,width: 2),
                                   borderRadius: BorderRadius.circular(50),
                                   color: Colors.transparent
                               ),
                               child: Card(
                                 color: Colors.transparent,
                                 child: ListTile(
                                   dense: true,
                                   visualDensity: VisualDensity.compact,
                                   contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                   leading: CircleAvatar(
                                     radius: 20,
                                     child: FaIcon(FontAwesomeIcons.googlePay,color: Colors.amber,),
                                   ),
                                   title: Text("UPI ID",style: TextStyle(color: Colors.white,fontSize: 10),),
                                   subtitle: Text("sumitkumar",style: TextStyle(color: Colors.white,fontSize: 10),),
                                 ),
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.zero,
                          child: Text("People",style: TextStyle(color: Colors.white,fontSize: 30),),
                          ),

                        ],
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 250,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: people.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: (people[index]['color'] as Color) ?? Colors.grey,
                                  child: people[index].containsKey("letter")
                                      ? Text(
                                    people[index]["letter"],
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  )
                                      : Icon(
                                    people[index]["icon"],
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  people[index]["name"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Money",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(
                "assets/images/Marvel.png",
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
