// import 'dart:convert';
//
// import 'Rest_api.dart';
// import 'package:http/http.dart' as http;
//
// class RestApiHelper {
//
//   final String _baseUrl="https://dummyjson.com/users";
//
//   Future<List<productsModal>> fetchProducts()async{
//     final response=await http.get(Uri.parse(_baseUrl),headers: {
//       "Content-Type":"application/json"
//     });
//     print(response.body);
//     if(response.statusCode==200){
//       Map<String, dynamic> data = jsonDecode(response.body);
//       return (data["users"] as List)
//           .map((e) => productsModal.fromJson(e))
//           .toList();
//
//     }
//     else{
//       return [];
//     }
//
//   }
//
// }

// import 'dart:convert';
//
// import 'Rest_api.dart';
// import 'package:http/http.dart' as http;
//
// class RestApiHelper {
//
//   final String _baseUrl="https://site-triangle-api.onrender.com/api/v1/users";
//   final String _token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTgsInJvbGVfaWQiOjEsInJvbGUiOiJTVVBFUl9BRE1JTiIsImlhdCI6MTc4Mjg4OTYzNCwiZXhwIjoxNzgzNDk0NDM0fQ.3HNC_LVqaZQPRCTfIezLmgO-7NG6K8GzAtnc8FVyIF0";
//
//   Future<productsModal> fetchProducts() async {
//     final response = await http.get(
//       Uri.parse(_baseUrl),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $_token",
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return productsModal.fromJson(data);
//     } else {
//       throw Exception("Failed to load users");
//     }
//   }
// }

import 'dart:convert';

import 'Rest_api.dart';
import 'package:http/http.dart' as http;

class RestApiHelper {

  final String _baseUrl = "https://demo-apis-college.onrender.com/employees";


  Future<ProductsModel> fetchProducts() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("${response.body} ===========================================");
      return ProductsModel.fromJson(data);
    } else {
      throw Exception("Failed to load users");
    }
  }
  Future<User> getEmployeeById(int id) async {
    final response = await http.get(
      Uri.parse("https://demo-apis-college.onrender.com/employees/$id"),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      print(response.body);

      return User.fromJson(json);
    } else {
      throw Exception("Employee not found");
    }
  }
  Future<int> addEmployee({
    required String name,
    required String email,
    required String phone,
    required String department,
    required String salary,
    required String hireDate,
  }) async {

    final response = await http.post(
      Uri.parse("https://demo-apis-college.onrender.com/employees"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "emp_name": name,
        "emp_email": email,
        "emp_phone": phone,
        "emp_department": department,
        "emp_salary": salary,
        "hire_date": hireDate,
      }),
    );

    final json = jsonDecode(response.body);

    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json["empId"];
    } else {
      throw Exception(json["message"] ?? "Error");
    }
  }
  Future<void> deleteEmployeeById(int id)async{
    final response=await http.delete(Uri.parse("$_baseUrl/$id"));
    if(response.statusCode==200){
      print("Employee Deleted Successfully : ${response.body}");
    }
    else{
      print("Employee Not Deleted ${response.body}");
    }

  }
  Future<void> updateEmployee(
      int id,
      Map<String, dynamic> body,
      ) async {
    print("ID: $id");
    print("URL: $_baseUrl/employees/$id");
    print("BODY: ${jsonEncode(body)}");

    final response = await http.put(
      Uri.parse("$_baseUrl/$id"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    print("Status Code: ${response.statusCode} ==============================================");
    print("Response: ${response.body} =======================================================");
  }
}