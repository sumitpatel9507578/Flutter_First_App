import 'dart:convert';

import 'Rest_api.dart';
import 'package:http/http.dart' as http;

class RestApiHelper {

  final String _baseUrl="https://fakestoreapi.com/products/";

  Future<List<productsModal>> fetchProducts()async{
    final response=await http.get(Uri.parse(_baseUrl),headers: {
      "Content-Type":"application/json"
    });
    print(response.body);
    if(response.statusCode==200){

      List data=jsonDecode(response.body);
      print(data.first);
      return data.map((e)=>productsModal.fromJson(e)).toList();

    }
    else{
      return [];
    }

  }

}