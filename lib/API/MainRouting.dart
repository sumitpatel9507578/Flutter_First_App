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
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Light Slate Background
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: const Color(0xFF0F172A), // Deep Slate/Blue
        title: const Text(
          "Employee Portal", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
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
                color: const Color(0xFF6366F1), // Indigo
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen())),
              ),
              const SizedBox(height: 20),
              _buildHomeButton(
                context, 
                title: "Single Employee", 
                color: const Color(0xFFF59E0B), // Amber
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Singleemployee())),
              ),
              const SizedBox(height: 20),
              _buildHomeButton(
                context, 
                title: "Add Employee", 
                colors: [Color(0xFF10B981), Color(0xFF34D399)], // Emerald Gradient
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployee())),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton(BuildContext context, {required String title, required Color color, required VoidCallback onTap}) {
    return Container(
      height: 58,
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 320),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }
}
