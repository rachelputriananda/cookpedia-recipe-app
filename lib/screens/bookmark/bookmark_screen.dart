import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  final List<Map<String, String>> _bookmarkedRecipes = const [
    {
      'title': 'Vegetable & Fruit Salad with Balsa...',
      'author': 'Jane Cooper',
      'avatar': 'https://i.pravatar.cc/100?img=1',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500',
    },
    {
      'title': 'Original Mixed Fruit & Vegetable...',
      'author': 'Florencio Dorrance',
      'avatar': 'https://i.pravatar.cc/100?img=8',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
    {
      'title': 'Nastar Recipe and Grated Sugar Co...',
      'author': 'Benny Spanbauer',
      'avatar': 'https://i.pravatar.cc/100?img=8',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
    {
      'title': 'Beef Broth Soup with Ginger & Ba...',
      'author': 'Sanjuanita Ordonez',
      'avatar': 'https://i.pravatar.cc/100?img=8',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
    {
      'title': 'Vegetable, Potato and Meat Salad',
      'author': 'Elanor Pera',
      'avatar': 'https://i.pravatar.cc/100?img=8',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
    {
      'title': 'Curcuma Ginger Beef Soup Recipe',
      'author': 'Augustina Midgett',
      'avatar': 'https://i.pravatar.cc/100?img=8',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
  ];

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
        title: const Text('My Bookmark', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black87), onPressed: () {}),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: _bookmarkedRecipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) {
          final item = _bookmarkedRecipes[index];
          return Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(item['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(radius: 9, backgroundImage: NetworkImage(item['avatar']!)),
                          const SizedBox(width: 6),
                          Expanded(child: Text(item['author']!, style: const TextStyle(color: Colors.white70, fontSize: 10))),
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
