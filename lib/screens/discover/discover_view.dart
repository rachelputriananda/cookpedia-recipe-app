import 'package:flutter/material.dart';
import '../chefs/chef_profile_screen.dart';
import '../chefs/top_chefs_screen.dart';
import 'category_detail_screen.dart';
import 'most_popular_screen.dart';
import 'recipe_categories_screen.dart';
import '../recipe/recipe_detail_screen.dart';
import '../search/search_screen.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  final List<Map<String, String>> _mostPopular = const [
    {
      'title': 'Vegetable and\nFruit Salad with ...',
      'author': 'Jane Cooper',
      'avatar': 'https://i.pravatar.cc/100?img=1',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500',
    },
    {
      'title': 'Italian Burger with\nCheese & Vegeta...',
      'author': 'Florencio Dorrance',
      'avatar': 'https://i.pravatar.cc/100?img=8',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500',
    },
  ];

  final List<Map<String, String>> _categories = const [
    {
      'name': 'Salad',
      'count': '16,278 recipes',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
    {
      'name': 'Burger',
      'count': '15,942 recipes',
      'image': 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=500',
    },
  ];

  final List<Map<String, String>> _topChefs = const [
    {
      'name': 'George',
      'image': 'https://images.unsplash.com/photo-1577219491135-ce391730fb2c?w=500',
    },
    {
      'name': 'Natasya',
      'image': 'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=500',
    },
    {
      'name': 'Nathan',
      'image': 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=500',
    },
  ];

  final List<Map<String, String>> _ourRecommendations = const [
    {
      'title': 'Sweet Sour\nSeasoned Grilled ...',
      'author': 'Tanner Stafford',
      'avatar': 'https://i.pravatar.cc/100?img=3',
      'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500',
    },
    {
      'title': 'Sweet Soy Sauce\nChicken Soup',
      'author': 'Cyndy Lillibridge',
      'avatar': 'https://i.pravatar.cc/100?img=4',
      'image': 'https://images.unsplash.com/photo-1547592180-85f173990554?w=500',
    },
  ];

  final List<Map<String, String>> _mostSearches = const [
    {
      'title': 'Sweet Cake Menu\nfor School Children',
      'author': 'Thad Eddings',
      'avatar': 'https://i.pravatar.cc/100?img=5',
      'image': 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500',
    },
    {
      'title': 'Easy Home\nJapanese Recipes',
      'author': 'Annabel Rohan',
      'avatar': 'https://i.pravatar.cc/100?img=6',
      'image': 'https://images.unsplash.com/photo-1611143669185-af224c5e3252?w=500',
    },
  ];

  final List<Map<String, String>> _newRecipes = const [
    {
      'title': 'Spicy Fried Noodles',
      'author': 'Clinton McClure',
      'avatar': 'https://i.pravatar.cc/100?img=7',
      'image': 'https://images.unsplash.com/photo-1612927601601-6638404737ce?w=500',
    },
    {
      'title': 'Grilled Beef Steak',
      'author': 'Charolette Hanlin',
      'avatar': 'https://i.pravatar.cc/100?img=9',
      'image': 'https://images.unsplash.com/photo-1544025162-d76694265947?w=500',
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
            // Header
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
                      const Text('Discover', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded, color: Colors.black87, size: 26),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.grey, size: 20),
                      SizedBox(width: 12),
                      Text(
                        'Search for Recipes or Chef',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Section 1: Most Popular
            _buildSectionHeader(
              'Most Popular',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MostPopularScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildRecipeHorizontalList(context, _mostPopular, height: 190),

            const SizedBox(height: 24),

            // Section 2: Recipe Categories
            _buildSectionHeader(
              'Recipe Categories',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecipeCategoriesScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildCategoryHorizontalList(context),

            const SizedBox(height: 24),

            // Section 3: Top Chefs
            _buildSectionHeader(
              'Top Chefs',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TopChefsScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildChefsHorizontalList(context),

            const SizedBox(height: 24),

            // Section 4: Our Recommendations
            _buildSectionHeader('Our Recommendations'),
            const SizedBox(height: 12),
            _buildRecipeHorizontalList(context, _ourRecommendations, height: 190),

            const SizedBox(height: 24),

            // Section 5: Most Searches
            _buildSectionHeader('Most Searches'),
            const SizedBox(height: 12),
            _buildRecipeHorizontalList(context, _mostSearches, height: 190),

            const SizedBox(height: 24),

            // Section 6: New Recipes
            _buildSectionHeader('New Recipes'),
            const SizedBox(height: 12),
            _buildRecipeHorizontalList(context, _newRecipes, height: 190),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
          GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.arrow_forward, color: Color(0xFFFF4D4D), size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeHorizontalList(BuildContext context, List<Map<String, String>> recipes, {required double height}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final item = recipes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecipeDetailScreen()),
              );
            },
            child: Container(
              width: 155,
              margin: const EdgeInsets.only(right: 14),
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
    );
  }

  Widget _buildCategoryHorizontalList(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final item = _categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailScreen(categoryName: item['name']!),
                ),
              );
            },
            child: Container(
              width: 155,
              margin: const EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: NetworkImage(item['image']!), fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(item['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 2),
                        Text(item['count']!, style: const TextStyle(color: Colors.white70, fontSize: 10)),
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

  Widget _buildChefsHorizontalList(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _topChefs.length,
        itemBuilder: (context, index) {
          final item = _topChefs[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChefProfileScreen(
                    chefName: '${item['name']} Eddings',
                    handle: '@${item['name']!.toLowerCase()}_eddings',
                    avatarUrl: item['image']!,
                  ),
                ),
              );
            },
            child: Container(
              width: 110,
              margin: const EdgeInsets.only(right: 12),
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
                        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    right: 8,
                    bottom: 10,
                    child: Text(
                      item['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
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
