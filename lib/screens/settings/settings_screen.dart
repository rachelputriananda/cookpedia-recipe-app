import 'package:flutter/material.dart';
import '../onboarding/welcome_screen.dart';
import 'about_cookpedia_screen.dart';
import 'help_center_screen.dart';
import 'invite_friends_screen.dart';
import 'language_screen.dart';
import 'notification_settings_screen.dart';
import 'personal_info_screen.dart';
import 'security_settings_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Logout',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFF4D4D)),
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF1F1F1), thickness: 1),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to log out?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF181A20)),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFEAEA),
                        foregroundColor: const Color(0xFFFF4D4D),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                              (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF4D4D),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Yes, Logout', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181A20)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          _buildMenuTile(Icons.person_outline, 'Personal Info', const Color(0xFFFFECE6), const Color(0xFFE07A5F), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInfoScreen()));
          }),
          _buildMenuTile(Icons.notifications_none, 'Notification', const Color(0xFFFFF7E6), const Color(0xFFE69138), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationSettingsScreen()));
          }),
          _buildMenuTile(Icons.security, 'Security', const Color(0xFFE6F7F0), const Color(0xFF34A853), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SecuritySettingsScreen()));
          }),
          _buildMenuTile(Icons.g_translate, 'Language', const Color(0xFFE6F0FA), const Color(0xFF4A90E2), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguageScreen()));
          }, trailingText: 'English (US)'),

          // Dark Mode Tile
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Color(0xFFEBEBFA), shape: BoxShape.circle),
              child: const Icon(Icons.remove_red_eye_outlined, color: Color(0xFF5B5BCC)),
            ),
            title: const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF181A20))),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (val) => setState(() => _isDarkMode = val),
              activeColor: const Color(0xFFFF4D4D),
            ),
          ),

          _buildMenuTile(Icons.people_outline, 'Invite Friends', const Color(0xFFFFECE6), const Color(0xFFE07A5F), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const InviteFriendsScreen()));
          }),
          _buildMenuTile(Icons.help_outline, 'Help Center', const Color(0xFFE6F7F0), const Color(0xFF34A853), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpCenterScreen()));
          }),
          _buildMenuTile(Icons.info_outline, 'About Cookpedia', const Color(0xFFE6F0FA), const Color(0xFF4A90E2), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutCookpediaScreen()));
          }),

          // Logout Tile
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Color(0xFFFFEAEA), shape: BoxShape.circle),
              child: const Icon(Icons.logout, color: Color(0xFFFF4D4D)),
            ),
            title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFFFF4D4D))),
            onTap: () => _showLogoutConfirmation(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(IconData icon, String title, Color bgColor, Color iconColor, VoidCallback onTap, {String? trailingText}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF181A20))),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(trailingText, style: const TextStyle(color: Color(0xFF616161), fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF212121)),
        ],
      ),
    );
  }
}
