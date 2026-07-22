import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  final Map<String, bool> _settings = {
    'Recommendations': true,
    'Following': true,
    'Comments': true,
    'Tagged': true,
    'Liked': true,
    'FollowedPublished': true,
    'Activity': false,
    'AppSystem': true,
    'Guidance': false,
    'Survey': false,
  };

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
        title: const Text('Notification', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text('Notify me when...', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
          ),
          _buildSwitchTile('There is a New Recommendations', 'Recommendations'),
          _buildSwitchTile('Someone is Following Me', 'Following'),
          _buildSwitchTile('There are Comments on My Recipe', 'Comments'),
          _buildSwitchTile('Someone Tagged Me in a Comment', 'Tagged'),
          _buildSwitchTile('Someone liked my comment', 'Liked'),
          _buildSwitchTile('Someone I follow published a new recipe', 'FollowedPublished'),
          _buildSwitchTile('There is Activity on My Account', 'Activity'),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text('System', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
          ),
          _buildSwitchTile('App System', 'AppSystem'),
          _buildSwitchTile('Guidance & Tips', 'Guidance'),
          _buildSwitchTile('Participate in a Survey', 'Survey'),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, String key) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF181A20))),
      trailing: Switch(
        value: _settings[key]!,
        onChanged: (val) => setState(() => _settings[key] = val),
        activeColor: const Color(0xFFFF4D4D),
      ),
    );
  }
}
