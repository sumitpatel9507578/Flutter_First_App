import 'package:flutter/material.dart';
import 'rest_api_helper.dart';
import 'Rest_api.dart';

class Singleemployee extends StatefulWidget {
  const Singleemployee({super.key});

  @override
  State<Singleemployee> createState() => _SingleemployeeState();
}

class _SingleemployeeState extends State<Singleemployee> {
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title:  Text("Single Employee",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              idController.clear();
            },
            icon:  Icon(Icons.clear),
          ),
        ],
      ),

      body: Padding(
        padding:  EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration:  InputDecoration(
                labelText: "Enter Employee ID",
                border: OutlineInputBorder(),
              ),
            ),

             SizedBox(height: 20),


           Container(
             height: 50,
             width: 200,
             decoration: BoxDecoration(
               color: Colors.blue
             ),
             child:  ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.blue,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
               ),
               onPressed: () async {
                 if (idController.text.isEmpty) {
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Please enter ID")),
                   );
                   return;
                 }

                 int id = int.parse(idController.text);

                 try {
                   User employee =
                   await RestApiHelper().getEmployeeById(id);

                   showDialog(
                     context: context,
                     builder: (context) {
                       return AlertDialog(
                         title:  Text("Employee Details"),
                         content: Column(
                           mainAxisSize: MainAxisSize.min,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Name: ${employee.empName}"),
                             Text("Email: ${employee.empEmail ?? 'N/A'}"),
                             Text("Phone: ${employee.empPhone}"),
                             Text("Department: ${employee.empDepartment ?? 'N/A'}"),
                             Text("Salary: ${employee.empSalary}"),
                           ],
                         ),
                         actions: [
                           TextButton(
                             onPressed: () => Navigator.pop(context),
                             child:  Text("Close"),
                           ),
                         ],
                       );
                     },
                   );
                 } catch (e) {
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Employee not found")),
                   );
                 }
               },
               child:  Text("Search",style: TextStyle(color: Colors.white),),
             ),
           )
          ],
        ),
      ),
    );
  }
}