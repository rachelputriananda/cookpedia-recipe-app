import 'package:flutter/material.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  final List<Map<String, dynamic>> _friends = [
    {'name': 'Darcel Ballentine', 'status': 'Invite', 'img': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100'},
    {'name': 'Benny Spanbauer', 'status': 'Invited', 'img': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100'},
    {'name': 'Phyllis Godley', 'status': 'Invite', 'img': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100'},
    {'name': 'Sanjuanita Ordonez', 'status': 'Invite', 'img': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100'},
    {'name': 'Lauralee Quintero', 'status': 'Invite', 'img': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=100'},
    {'name': 'Chantal Shelburne', 'status': 'Invited', 'img': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=100'},
  ];

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
        title: const Text('Invite Friends', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Color(0xFF181A20)), onPressed: () {}),
          const SizedBox(width: 12),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        itemCount: _friends.length,
        itemBuilder: (context, index) {
          final friend = _friends[index];
          bool isInvited = friend['status'] == 'Invited';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                CircleAvatar(radius: 24, backgroundImage: NetworkImage(friend['img'])),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(friend['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _friends[index]['status'] = isInvited ? 'Invite' : 'Invited';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInvited ? Colors.white : const Color(0xFFFF4D4D),
                    foregroundColor: isInvited ? const Color(0xFFFF4D4D) : Colors.white,
                    side: isInvited ? const BorderSide(color: Color(0xFFFF4D4D)) : BorderSide.none,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  ),
                  child: Text(friend['status'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
