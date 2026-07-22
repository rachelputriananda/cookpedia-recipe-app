import 'package:flutter/material.dart';
import '../recipe/recipe_detail_screen.dart';
import '../search/search_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;
  const CategoryDetailScreen({super.key, required this.categoryName});

  final List<Map<String, String>> _saladRecipes = const [
    {
      'title': 'Vegetable and\nFruit Green Salad',
      'author': 'Willard Purnell',
      'avatar': 'https://i.pravatar.cc/100?img=15',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
    {
      'title': 'Vegetable & Fruit\nSalad with Balsa...',
      'author': 'Jane Cooper',
      'avatar': 'https://i.pravatar.cc/100?img=1',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500',
    },
    {
      'title': 'Fresh Seasoned\nVegetable Salad',
      'author': 'Phyllis Godley',
      'avatar': 'https://i.pravatar.cc/100?img=16',
      'image': 'https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=500',
    },
    {
      'title': 'Vegetable Lettuce\nSalad with Simpl...',
      'author': 'Clinton McClure',
      'avatar': 'https://i.pravatar.cc/100?img=7',
      'image': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
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
        title: Text(
          categoryName,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500'),
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
                          colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.75)],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(categoryName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                          const SizedBox(height: 2),
                          const Text('16.278 recipes', style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sort by', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
                  Row(
                    children: const [
                      Text('Most Popular', style: TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.w600, fontSize: 14)),
                      SizedBox(width: 4),
                      Icon(Icons.swap_vert, color: Color(0xFFFF4D4D), size: 18),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _saladRecipes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final item = _saladRecipes[index];
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
                                    CircleAvatar(radius: 9, backgroundImage: NetworkImage(item['avatar']!)),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        item['author']!,
                                        style: const TextStyle(color: Colors.white70, fontSize: 10),
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
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
