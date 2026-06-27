import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        centerTitle: true,
      title: Text("P A Y M E N T",style: TextStyle(color: Colors.blue,),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check))
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20,),
                  Padding(padding: EdgeInsets.zero,child:   Container(
                    height: 210,
                    width: 310,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.topRight,
                          child:  Image.asset("assets/images/img.png",height: 59,width: 59,),
                        ),
                        Padding(padding: EdgeInsets.zero,child:   Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("**** **** **** 1027",style: TextStyle(color: Colors.white,fontSize: 25),),

                          ],
                        )),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 20),child:  Text("Expire\n02/24",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),),
                            SizedBox(width: 20,),
                            Text("CVV\n098",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 15),),
                          ],
                        ),SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.only(left: 20),child:   Text("Nick Name",style: TextStyle(color: Colors.white,fontSize: 15),),),
                        Padding(padding: EdgeInsets.only(left: 20),child: Text("Sumit Patel",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),)
                      ],
                    ),
                  ),),
                  SizedBox(width: 20,),
                  Padding(padding: EdgeInsets.zero,child:   Container(
                    height: 210,
                    width: 310,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.topRight,
                          child:  Image.asset("assets/images/img.png",height: 59,width: 59,),
                        ),
                        Padding(padding: EdgeInsets.zero,child:   Row(
                          children: [
                          SizedBox(width: 20,),
                            Text("**** **** **** 1088",style: TextStyle(color: Colors.white,fontSize: 25),),

                          ],
                        )),

                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 20),child:  Text("Expire\n11/30",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),),
                            SizedBox(width: 20,),
                            Text("CVV\n077",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 15),),
                          ],
                        ),SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.only(left: 20),child:   Text("Nick Name",style: TextStyle(color: Colors.white,fontSize: 15),),),
                        Padding(padding: EdgeInsets.only(left: 20),child: Text("Dev Patel",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),)
                      ],
                    ),
                  ),),

                ],
              ),
            ),

           SizedBox(height: 30,),
           Padding(padding: EdgeInsets.only(left: 20),child:  Text("Amount",style: TextStyle(color: Colors.grey.shade700,fontSize: 15),),),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),child: Container(width: 100,child: TextField(),),),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.only(left: 20),child: Text("Remark",style: TextStyle(color: Colors.grey.shade700,fontSize: 15),),),
            Padding(padding: EdgeInsets.only(left: 30,right: 30),child: TextField(),)
          ],
        ),
      ),
    );
  }
}
