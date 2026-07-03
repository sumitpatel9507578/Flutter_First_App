import 'package:flutter/material.dart';
import 'Post_Screen.dart';
import 'add_Employee.dart';
import 'singleEmployee.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        title: const Text("Home Screen", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHomeButton(
                context, 
                title: "All Employee", 
                color: theme.colorScheme.primary,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen())),
              ),
              const SizedBox(height: 20),
              _buildHomeButton(
                context, 
                title: "Single Employee", 
                color: theme.colorScheme.secondary,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Singleemployee())),
              ),
              const SizedBox(height: 20),
              _buildHomeButton(
                context, 
                title: "Add Employee", 
                color: Colors.green.shade600,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEmployee())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context, {required String title, required Color color, required VoidCallback onTap}) {
    return Container(
      height: 55,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 320),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }
}
