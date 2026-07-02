import 'dart:convert';

import 'Rest_api.dart';
import 'package:http/http.dart' as http;

class RestApiHelper {

  final String _baseUrl="https://dummyjson.com/users";

  Future<productsModal> fetchProducts() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_token",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return productsModal.fromJson(data);
    } else {
      throw Exception("Failed to load users");
    }
    else{
      return [];
    }

  }

}