import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rest_api_helper.dart';
import 'Rest_api.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestApiHelper apiHelper = RestApiHelper();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: theme.colorScheme.primary,
        title: Text(
          "User Directory",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_rounded),
          )
        ],
      ),
      drawer: _buildDrawer(context),
      body: FutureBuilder<List<productsModal>>(
        future: apiHelper.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
                strokeWidth: 3,
              ),
            );
          } else if (snapshot.hasError) {
            return _buildErrorState(snapshot.error.toString());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return UserProfileCard(user: snapshot.data![index]);
              },
            );
          } else {
            return const Center(child: Text("No users found"));
          }
        },
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red[50],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.cloud_off_rounded, size: 64, color: Colors.red[400]),
            ),
            const SizedBox(height: 24),
            Text(
              "Something went wrong",
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const CircleAvatar(
                backgroundColor: Color(0xFFF1F1F1),
                child: Icon(Icons.person, size: 45, color: Colors.grey),
              ),
            ),
            accountName: Text(
              "Sumit Patel",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text(
              "sumit@gmail.com",
              style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9)),
            ),
          ),
          _drawerItem(CupertinoIcons.home, "Dashboard", () => Navigator.pop(context)),
          _drawerItem(CupertinoIcons.person_2, "Team Members", () => Navigator.pop(context)),
          _drawerItem(CupertinoIcons.settings, "Preferences", () => Navigator.pop(context)),
          const Spacer(),
          const Divider(),
          _drawerItem(Icons.logout_rounded, "Logout", () => Navigator.pop(context), color: Colors.red),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.grey[700], size: 22),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: color ?? Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }
}

class UserProfileCard extends StatelessWidget {
  final productsModal user;

  const UserProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Upper Profile Section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Hero(
                  tag: 'user-${user.id}',
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2), width: 3),
                    ),
                    child: CircleAvatar(
                      radius: 38,
                      backgroundColor: const Color(0xFFF1F1F1),
                      backgroundImage: NetworkImage(user.image),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          user.role.toUpperCase(),
                          style: GoogleFonts.poppins(
                            color: theme.colorScheme.primary,
                            fontSize: 10,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _badge(Icons.cake_rounded, "${user.age} yrs", theme),
                          const SizedBox(width: 8),
                          _badge(Icons.bloodtype_rounded, user.bloodGroup, theme),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert_rounded, color: Colors.grey[400]),
                ),
              ],
            ),
          ),

          // Divider
          Divider(height: 1, color: Colors.grey[100]),

          // Contact Details Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                _buildContactRow(Icons.alternate_email_rounded, user.email, "Email"),
                const SizedBox(height: 12),
                _buildContactRow(Icons.phone_iphone_rounded, user.phone, "Mobile"),
                const SizedBox(height: 12),
                _buildContactRow(Icons.map_rounded, user.address, "Address", isAddress: true),
              ],
            ),
          ),

          // Interactive Footer / Expansion
          Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 20),
              title: Text(
                "Professional Background",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _buildDetailItem(Icons.school_rounded, "Education", user.university),
                        _buildDetailItem(Icons.work_rounded, "Company", user.company),
                        _buildDetailItem(Icons.payments_rounded, "Bank Info", user.bank),
                        _buildDetailItem(Icons.currency_bitcoin_rounded, "Crypto", user.crypto),
                        _buildDetailItem(Icons.lan_rounded, "Network", "IP: ${user.ip}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(IconData icon, String text, ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String value, String label, {bool isAddress = false}) {
    return Row(
      crossAxisAlignment: isAddress ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF64748B)),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[500], fontWeight: FontWeight.w500),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
                maxLines: isAddress ? 2 : 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blueGrey[300]),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
                children: [
                  TextSpan(text: "$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: value, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
