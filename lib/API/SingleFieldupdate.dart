import 'package:flutter/material.dart';
import 'Rest_api.dart';
import 'rest_api_helper.dart';

class EditEmployeeScreen extends StatefulWidget {
  final User user;
  const EditEmployeeScreen({super.key, required this.user});

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreen();
}

class _EditEmployeeScreen extends State<EditEmployeeScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final departmentController = TextEditingController();
  final salaryController = TextEditingController();
  final hiredateController = TextEditingController();
  RestApiHelper apiHelper = RestApiHelper();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.empName;
    emailController.text = widget.user.empEmail ?? "";
    hiredateController.text = widget.user.empHire ?? "";
    phoneController.text = widget.user.empPhone;
    departmentController.text = widget.user.empDepartment ?? "";
    salaryController.text = widget.user.empSalary ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        title: const Text(
          "Edit Employee",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: nameController,
                        label: "Full Name",
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: emailController,
                        label: "Email Address",
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: phoneController,
                        label: "Phone Number",
                        icon: Icons.phone_android_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: departmentController,
                        label: "Department",
                        icon: Icons.business_outlined,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: salaryController,
                        label: "Salary",
                        icon: Icons.currency_rupee_outlined,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: hiredateController,
                        label: "Hire Date",
                        icon: Icons.calendar_month_outlined,
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 2,
                          ),
                          onPressed: () async {
                            await apiHelper.updateEmployee(
                              widget.user.empId,
                              {
                                "emp_name": nameController.text,
                                "emp_email": emailController.text,
                                "emp_phone": phoneController.text,
                                "emp_department": departmentController.text,
                                "emp_salary": salaryController.text,
                                "hire_date": hiredateController.text,
                              },
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Profile Updated Successfully!")),
                            );

                            Navigator.pop(context, true);
                          },
                          child: const Text(
                            "UPDATE DETAILS",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
}
