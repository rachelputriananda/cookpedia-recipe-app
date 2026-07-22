import 'package:flutter/material.dart';
import 'chef_followers_screen.dart';
import '../recipe/recipe_detail_screen.dart';

class ChefProfileScreen extends StatefulWidget {
  final String chefName;
  final String handle;
  final String avatarUrl;

  const ChefProfileScreen({
    super.key,
    required this.chefName,
    required this.handle,
    required this.avatarUrl,
  });

  @override
  State<ChefProfileScreen> createState() => _ChefProfileScreenState();
}

class _ChefProfileScreenState extends State<ChefProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isFollowing = false;

  final List<Map<String, String>> _chefRecipes = const [
    {'title': 'Fresh Tuna\nJapanese Sushi R...', 'image': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500'},
    {'title': 'Cheeseburger and\nSmoked Beef Rec...', 'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500'},
    {'title': 'Delicious Italian\nPizza Recipes', 'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500'},
    {'title': 'Beef Beef Sweet\nand Sour Spices', 'image': 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          IconButton(icon: const Icon(Icons.send_outlined, color: Colors.black87, size: 22), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_horiz_rounded, color: Colors.black87, size: 26), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                CircleAvatar(radius: 30, backgroundImage: NetworkImage(widget.avatarUrl)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.chefName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xFF181A20))),
                      const SizedBox(height: 2),
                      Text(widget.handle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFollowing = !isFollowing;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFollowing ? Colors.white : const Color(0xFFFF4D4D),
                    elevation: 0,
                    side: isFollowing ? const BorderSide(color: Color(0xFFFF4D4D)) : BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  child: Text(
                    isFollowing ? 'Following' : 'Follow',
                    style: TextStyle(color: isFollowing ? const Color(0xFFFF4D4D) : Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('245', 'recipes'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ChefFollowersScreen(initialIndex: 0)));
                  },
                  child: _buildStatColumn('127', 'following'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ChefFollowersScreen(initialIndex: 1)));
                  },
                  child: _buildStatColumn('29.5K', 'followers'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFFFF4D4D),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFFFF4D4D),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [Tab(text: 'Recipes'), Tab(text: 'About')],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildRecipesTab(), _buildAboutTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(number, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF181A20))),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildRecipesTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _chefRecipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final item = _chefRecipes[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeDetailScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: NetworkImage(item['image']!), fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.85)],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(color: Color(0xFFFF4D4D), shape: BoxShape.circle),
                    child: const Icon(Icons.bookmark, color: Colors.white, size: 16),
                  ),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Text(
                    item['title']!,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, height: 1.25),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF181A20))),
          const SizedBox(height: 8),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 20),
          const Text('Social Media', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF181A20))),
          const SizedBox(height: 12),
          _buildSocialItem(Icons.chat_bubble, 'WhatsApp', const Color(0xFFFF4D4D)),
          _buildSocialItem(Icons.facebook, 'Facebook', const Color(0xFFFF4D4D)),
          _buildSocialItem(Icons.flutter_dash, 'Twitter', const Color(0xFFFF4D4D)),
          _buildSocialItem(Icons.camera_alt, 'Instagram', const Color(0xFFFF4D4D)),
          const SizedBox(height: 20),
          const Text('More Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF181A20))),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.language, 'www.exampledomain.com', isLink: true),
          _buildInfoRow(Icons.location_on_outlined, 'New York, United States'),
          _buildInfoRow(Icons.info_outline, 'Joined since Aug 24, 2020'),
          _buildInfoRow(Icons.bar_chart, '2,368,756 views'),
        ],
      ),
    );
  }

  Widget _buildSocialItem(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {bool isLink = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFFFF4D4D)),
          const SizedBox(width: 10),
          Text(text, style: TextStyle(color: isLink ? const Color(0xFFFF4D4D) : Colors.black87, fontSize: 13)),
        ],
      ),
    );
  }
}
