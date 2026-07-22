import 'package:flutter/material.dart';
import '../search/search_screen.dart';

class ChefFollowersScreen extends StatefulWidget {
  final int initialIndex;
  const ChefFollowersScreen({super.key, this.initialIndex = 1});

  @override
  State<ChefFollowersScreen> createState() => _ChefFollowersScreenState();
}

class _ChefFollowersScreenState extends State<ChefFollowersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _usersList = [
    {'name': 'Rodolfo Goode', 'handle': '@rodolfo_goode', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=11'},
    {'name': 'Chieko Chute', 'handle': '@chieko_chute', 'isFollowing': true, 'avatar': 'https://i.pravatar.cc/100?img=5'},
    {'name': 'Kylee Danford', 'handle': '@kylee_danford', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=12'},
    {'name': 'Chantal Shelburne', 'handle': '@chantal_shelburne', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=9'},
    {'name': 'Phyllis Godley', 'handle': '@phyllis_godley', 'isFollowing': true, 'avatar': 'https://i.pravatar.cc/100?img=16'},
    {'name': 'Francene Vandyne', 'handle': '@francene_vandyne', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=20'},
    {'name': 'Tyra Dhillon', 'handle': '@tyra_dhillon', 'isFollowing': true, 'avatar': 'https://i.pravatar.cc/100?img=25'},
    {'name': 'Edgar Torrey', 'handle': '@edgar_torrey', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=33'},
    {'name': 'Tynisha Obey', 'handle': '@tynisha_obey', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=41'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87, size: 26),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFFF4D4D)),
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xFFFF4D4D),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                tabs: const [Tab(text: 'Following'), Tab(text: 'Followers')],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildUserListView(), _buildUserListView()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: _usersList.length,
      itemBuilder: (context, index) {
        final user = _usersList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              CircleAvatar(radius: 22, backgroundImage: NetworkImage(user['avatar'])),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF181A20))),
                    const SizedBox(height: 2),
                    Text(user['handle'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    user['isFollowing'] = !user['isFollowing'];
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: user['isFollowing'] ? Colors.white : const Color(0xFFFF4D4D),
                  elevation: 0,
                  side: user['isFollowing'] ? const BorderSide(color: Color(0xFFFF4D4D)) : BorderSide.none,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  user['isFollowing'] ? 'Following' : 'Follow',
                  style: TextStyle(
                    color: user['isFollowing'] ? const Color(0xFFFF4D4D) : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
