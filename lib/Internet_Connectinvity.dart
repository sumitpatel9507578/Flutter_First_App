import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InterCheck extends StatefulWidget {
  const InterCheck({super.key});

  @override
  State<InterCheck> createState() => _InterCheckState();
}

class _InterCheckState extends State<InterCheck> {
  bool isConnect=false;

  @override
  void initState() {
    super.initState();
    checkInternet();
    Connectivity().onConnectivityChanged.listen((result){
      setState(() {
        isConnect = result.any((r) => r != ConnectivityResult.none);
      });
    });
  }

Future<void> checkInternet() async{
  final result = await Connectivity().checkConnectivity();
 setState(() {
   isConnect = result.any((r) => r != ConnectivityResult.none);
 });
}
List<Map<String,dynamic>> a=[
  {"title":"Sumit Kumar","sub":"Flutter Developer","image":"assets/images/Avatar.png","address":"Hussepur"},
  {"title":"Amit Kumar","sub":"Iti Electrician","image":"assets/images/img_1.png","address":"Assam"},
  {"title":"Rahul Kumar","sub":"Business Man","image":"assets/images/img.png","address":"Arunachal Pradesh"},
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
        title: Text("To Do All List",style: TextStyle(color: Colors.white),),
        actions: [
          Column(
            children: [
              Icon(isConnect?Icons.wifi:Icons.wifi_off,size: 20,color: isConnect?Colors.green:Colors.red,),
              Text(isConnect?"Connected":"DisConnected",style: TextStyle(color: isConnect?Colors.green:Colors.red),)
            ],
          )
        ],
      ),
      drawer: Drawer(),
      body:  ListView(
        children: [
          ListView.builder(
            itemCount: a.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(20),
                height: 300,
                width: 300,

                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(a[index]["image"],height: 200,),
                   Padding(padding: EdgeInsets.only(left: 20),child:  Text(a[index]["title"]),),
                    Padding(padding: EdgeInsets.only(left: 20),child:  Text(a[index]["sub"]),),
                    Padding(padding: EdgeInsets.only(left: 20),child:  Text(a[index]["address"]),),
                  ],
                ),
              );
            },

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: (){

      },
        child: Icon(Icons.add),
      ),
    );
  }
}
