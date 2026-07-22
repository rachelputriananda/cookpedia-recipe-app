import 'package:flutter/material.dart';
import 'category_detail_screen.dart';
import '../search/search_screen.dart';

class RecipeCategoriesScreen extends StatelessWidget {
  const RecipeCategoriesScreen({super.key});

  final List<Map<String, String>> _categories = const [
    {'name': 'Salad', 'count': '16.278 recipes', 'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500'},
    {'name': 'Burger', 'count': '15.942 recipes', 'image': 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=500'},
    {'name': 'Pizza', 'count': '14.385 recipes', 'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500'},
    {'name': 'Noodles', 'count': '15.293 recipes', 'image': 'https://images.unsplash.com/photo-1612927601601-6638404737ce?w=500'},
    {'name': 'Beef', 'count': '12.849 recipes', 'image': 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500'},
    {'name': 'Chicken', 'count': '18.237 recipes', 'image': 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=500'},
    {'name': 'Sushi', 'count': '10.683 recipes', 'image': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500'},
    {'name': 'Rice', 'count': '16.843 recipes', 'image': 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500'},
    {'name': 'Seafood', 'count': '13.585 recipes', 'image': 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500'},
    {'name': 'Cake', 'count': '17.488 recipes', 'image': 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500'},
    {'name': 'Soup', 'count': '11.384 recipes', 'image': 'https://images.unsplash.com/photo-1547592180-85f173990554?w=500'},
    {'name': 'Bread', 'count': '13.852 recipes', 'image': 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500'},
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
        title: const Text(
          'Recipe Categories',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
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
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        itemCount: _categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.45,
        ),
        itemBuilder: (context, index) {
          final item = _categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryDetailScreen(categoryName: item['name']!)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: NetworkImage(item['image']!), fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.75)],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(item['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 2),
                        Text(item['count']!, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
