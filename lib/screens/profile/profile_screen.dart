import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import '../settings/settings_screen.dart';
import '../../widgets/sliver_tab_bar_delegate.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _profileTabController;

  final List<Map<String, String>> _myPublishedRecipes = [
    {
      'title': 'Vegetable Fruit Salad Simple Rec...',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80',
    },
    {
      'title': 'Vegetable, Fruit and Meat Salad',
      'image': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&q=80',
    },
    {
      'title': 'Sweet and Spicy Beef Soup Recipe',
      'image': 'https://images.unsplash.com/photo-1547592165-e1d17fed6005?w=500&q=80',
    },
    {
      'title': 'Chicken Noodles with Vegetables ...',
      'image': 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80',
    },
  ];

  @override
  void initState() {
    super.initState();
    _profileTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _profileTabController.dispose();
    super.dispose();
  }

  // --- No. 49: AKTIFKAN MODAL SHARE BOTTOM SHEET ---
  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      builder: (context) {
        final List<Map<String, dynamic>> socialApps = [
          {'name': 'WhatsApp', 'icon': Icons.phone_android, 'color': const Color(0xFF25D366)},
          {'name': 'Twitter', 'icon': Icons.alternate_email, 'color': const Color(0xFF1DA1F2)},
          {'name': 'Facebook', 'icon': Icons.facebook, 'color': const Color(0xFF1877F2)},
          {'name': 'Instagram', 'icon': Icons.camera_alt, 'color': const Color(0xFFE1306C)},
          {'name': 'Yahoo', 'icon': Icons.mail, 'color': const Color(0xFF6001D2)},
          {'name': 'TikTok', 'icon': Icons.music_note, 'color': const Color(0xFF000000)},
          {'name': 'Chat', 'icon': Icons.chat_bubble, 'color': const Color(0xFF007AFF)},
          {'name': 'WeChat', 'icon': Icons.wechat, 'color': const Color(0xFF09BB07)},
        ];

        return Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Share',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20)),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: socialApps.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final app = socialApps[index];
                  return InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: app['color'],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(app['icon'], color: Colors.white, size: 24),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          app['name'],
                          style: const TextStyle(fontSize: 12, color: Color(0xFF181A20), fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
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
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4D4D).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.restaurant_menu, color: Color(0xFFFF4D4D), size: 18),
            ),
            const SizedBox(width: 10),
            const Text(
              'Profile',
              style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Color(0xFF181A20)),
            onPressed: () => _showShareBottomSheet(context),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xFF181A20)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&q=80'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Andrew Ainsley',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20)),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '@andrew_ainsley',
                                style: TextStyle(fontSize: 13, color: Colors.grey[500], fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        // --- Tombol Edit yang Berhasil Berpindah ke Halaman Edit (No. 50) ---
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                            );
                          },
                          icon: const Icon(Icons.edit, size: 14, color: Color(0xFFFF4D4D)),
                          label: const Text('Edit', style: TextStyle(color: Color(0xFFFF4D4D), fontSize: 13, fontWeight: FontWeight.bold)),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFFF4D4D)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('125', 'recipes'),
                        _buildStatDivider(),
                        _buildStatColumn('104', 'following'),
                        _buildStatDivider(),
                        _buildStatColumn('5,278', 'followers'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverTabBarDelegate(
                TabBar(
                  controller: _profileTabController,
                  indicatorColor: const Color(0xFFFF4D4D),
                  indicatorWeight: 3,
                  labelColor: const Color(0xFFFF4D4D),
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  tabs: const [
                    Tab(text: 'Recipes'),
                    Tab(text: 'About'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _profileTabController,
          children: [
            _buildProfileRecipeGrid(_myPublishedRecipes),
            const SingleChildScrollView(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Hello! I am Andrew, a passionate food blogger and chef who loves to share simple and healthy recipes. Welcome to my kitchen diary!',
                style: TextStyle(fontSize: 14, color: Color(0xFF181A20), height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[500], fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(height: 30, width: 1, color: Colors.grey[200]);
  }

  Widget _buildProfileRecipeGrid(List<Map<String, String>> recipes) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.85,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Image.network(
                recipe['image']!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[200]),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: Text(
                  recipe['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF4D4D),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.bookmark, color: Colors.white, size: 13),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
