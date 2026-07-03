
import 'package:flutter/material.dart';
import 'rest_api_helper.dart';
import 'Rest_api.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final deptController = TextEditingController();
  final salaryController = TextEditingController();
  final api = RestApiHelper();

  void submitData() async {
    try {
      await api.addEmployee(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        department: deptController.text,
        salary: salaryController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Employee Added Successfully")),
      );

      nameController.clear();
      emailController.clear();
      phoneController.clear();
      deptController.clear();
      salaryController.clear();

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("Add Employee",style: TextStyle(color: Colors.white),),
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
         Padding(padding: .all(20),
           child:  Column(
             children: [
               TextField(controller: nameController, decoration:  InputDecoration(labelText: "Name")),
               TextField(controller: emailController, decoration:  InputDecoration(labelText: "Email")),
               TextField(controller: phoneController,keyboardType: .number, decoration:  InputDecoration(labelText: "Phone")),
               TextField(controller: deptController, decoration:  InputDecoration(labelText: "Department")),
               TextField(controller: salaryController,keyboardType: .number, decoration:  InputDecoration(labelText: "Salary")),
               SizedBox(height: 20,),
               Container(
                 height: 50,
                 width: 200,
                 decoration: BoxDecoration(
                     color: Colors.blue
                 ),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                   ),
                   onPressed: () async {

                     final int empId = await api.addEmployee(
                       name: nameController.text,
                       email: emailController.text,
                       phone: phoneController.text,
                       department: deptController.text,
                       salary: salaryController.text,
                     );

                     showDialog(
                       context: context,
                       builder: (_) {
                         return AlertDialog(
                           title:  Text("SuccessFull Added",style: TextStyle(color: Colors.blue),),
                           content: Column(
                             mainAxisSize: MainAxisSize.min,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("ID: $empId"),
                               Text("Name: ${nameController.text}"),
                               Text("Email: ${emailController.text}"),
                               Text("Phone: ${phoneController.text}"),
                               Text("Department: ${deptController.text}"),
                               Text("Salary: ${salaryController.text}"),
                             ],
                           ),
                           actions: [
                             TextButton(
                               onPressed: () => Navigator.pop(context),
                               child:  Text("OK"),
                             ),
                           ],
                         );
                       },
                     );
                   },
                   child:  Text("Save",style: TextStyle(color: Colors.white),),
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
