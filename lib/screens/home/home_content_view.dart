import 'package:flutter/material.dart';
import '../bookmark/bookmark_screen.dart';
import '../notifications/notification_screen.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key});

  final List<Map<String, String>> _recentRecipes = const [
    {
      'title': 'Original Italian\nPizza Recipe for ...',
      'author': 'Jane Cooper',
      'avatar': 'https://i.pravatar.cc/100?img=1',
      'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500',
    },
    {
      'title': 'Special Blueberry\n& Banana Sandw...',
      'author': 'Rayford Chenail',
      'avatar': 'https://i.pravatar.cc/100?img=2',
      'image': 'https://images.unsplash.com/photo-1484723091739-30a597c7f486?w=500',
    },
  ];

  final List<Map<String, String>> _yourRecipes = const [
    {
      'title': 'Vegetable & Fruit\nVegetarian Recip...',
      'author': 'Tanner Stafford',
      'avatar': 'https://i.pravatar.cc/100?img=3',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500',
    },
    {
      'title': 'Delicious & Easy\nMexican Taco Re...',
      'author': 'Lauralee Quintero',
      'avatar': 'https://i.pravatar.cc/100?img=4',
      'image': 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=500',
    },
  ];

  final List<Map<String, String>> _yourBookmark = const [
    {
      'title': 'Meat, Noodle and\nSeafood Recipes ...',
      'author': 'Clinton McClure',
      'avatar': 'https://i.pravatar.cc/100?img=5',
      'image': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500',
    },
    {
      'title': 'Scrambled Eggs &\nFrench Bread ...',
      'author': 'Charolette Hanlin',
      'avatar': 'https://i.pravatar.cc/100?img=6',
      'image': 'https://images.unsplash.com/photo-1525351484163-7529414344d8?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF4D4D),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.restaurant, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Cookpedia',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF181A20)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none_outlined, color: Colors.black87, size: 26),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NotificationScreen()),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border_rounded, color: Colors.black87, size: 26),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BookmarkScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Banner Chef Promo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5252),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 180,
                            child: Text(
                              'Learn how to become a master chef right now!',
                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, height: 1.3),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 32,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFFFF4D4D),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              child: const Text('Read more', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: Image.network(
                        'https://png.pngtree.com/png-clipart/20230928/original/pngtree-young-chef-showing-ok-sign-png-image_13164912.png',
                        height: 135,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 100, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Section 1: Recent Recipes
            _buildSectionHeader('Recent Recipes'),
            const SizedBox(height: 12),
            _buildHorizontalRecipeList(_recentRecipes),

            const SizedBox(height: 24),

            // Section 2: Your Recipes
            _buildSectionHeader('Your Recipes'),
            const SizedBox(height: 12),
            _buildHorizontalRecipeList(_yourRecipes),

            const SizedBox(height: 24),

            // Section 3: Your Bookmark
            _buildSectionHeader('Your Bookmark'),
            const SizedBox(height: 12),
            _buildHorizontalRecipeList(_yourBookmark),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
          const Icon(Icons.arrow_forward, color: Color(0xFFFF4D4D), size: 20),
        ],
      ),
    );
  }

  Widget _buildHorizontalRecipeList(List<Map<String, String>> recipes) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final item = recipes[index];
          return Container(
            width: 155,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(item['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF4D4D),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.bookmark_remove_rounded, color: Colors.white, size: 16),
                  ),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, height: 1.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: NetworkImage(item['avatar']!),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              item['author']!,
                              style: const TextStyle(color: Colors.white70, fontSize: 11),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
