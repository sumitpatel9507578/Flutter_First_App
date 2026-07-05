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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        title: const Text(
          "Management Portal",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.admin_panel_settings, size: 50, color: Colors.blue),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Welcome, Admin",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Manage your employees and records",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Action Buttons Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildMenuCard(
                  context,
                  title: "All Employee Records",
                  subtitle: "View and manage all employees",
                  icon: Icons.people_alt_rounded,
                  color: Colors.blue[700]!,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PostScreen())),
                ),
                const SizedBox(height: 15),
                _buildMenuCard(
                  context,
                  title: "Single Employee Details",
                  subtitle: "Search and view a specific employee",
                  icon: Icons.person_search_rounded,
                  color: Colors.indigo[700]!,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Singleemployee())),
                ),
                const SizedBox(height: 15),
                _buildMenuCard(
                  context,
                  title: "Add New Employee",
                  subtitle: "Register a new employee to system",
                  icon: Icons.person_add_alt_1_rounded,
                  color: Colors.teal[700]!,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEmployee())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
