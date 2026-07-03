import 'PostModel.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  final _baseUrl="https://fakestoreapi.com";

  Future<void> createPost(PostModel post)async{
    final response=await  http.post(Uri.parse("$_baseUrl/products"),
        body: jsonEncode(post.toJson())
    );

    if(response.statusCode==201){
      print("Data inserted Successfully");
      print("Post Response data : ${response.body}");
    }
    else{
      print("Failed ${response.body}");
    }


  }

}