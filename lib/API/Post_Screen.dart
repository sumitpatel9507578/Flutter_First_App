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
        backgroundColor: Colors.blue,
        title: Text("REST API",style: TextStyle(color: Colors.white),),
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
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.80,

              ),
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                print(data[index].category);
                print(data[index].description);
                return Padding(
                    padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10,),
                      height: 500,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            )
                          ],
                      ),
                      child: Column(
                        children: [
                         Align(
                           alignment:Alignment.topRight,
                           child: Container(
                             height: 40,
                             width: 40,
                             decoration: BoxDecoration(
                                 color: Colors.orange,
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                             ),
                             child: Icon(CupertinoIcons.heart,color: Colors.white,),
                           ),
                         ),
                          Image.network(data[index].image,height: 100,),
                          Text(data[index].title,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.clip,),
                          Row(
                            children: [
                              Text("💲${data[index].Price}",style: TextStyle(color: Colors.black),),
                              SizedBox(width: 35,),
                              CircleAvatar(backgroundColor: Colors.black,radius: 5,),
                              CircleAvatar(backgroundColor: Colors.green,radius: 5,),
                              CircleAvatar(backgroundColor: Colors.pink,radius: 5,),
                              CircleAvatar(backgroundColor: Colors.blue,radius: 5,),

                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
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