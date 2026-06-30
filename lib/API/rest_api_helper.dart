import 'dart:convert';

import 'Rest_api.dart';
import 'package:http/http.dart' as http;

class RestApiHelper {

  final String _baseUrl="https://dummyjson.com/users";

  Future<List<productsModal>> fetchProducts()async{
    final response=await http.get(Uri.parse(_baseUrl),headers: {
      "Content-Type":"application/json"
    });
    print(response.body);
    if(response.statusCode==200){
      Map<String, dynamic> data = jsonDecode(response.body);
      return (data["users"] as List)
          .map((e) => productsModal.fromJson(e))
          .toList();

    }
    else{
      return [];
    }

  }

}