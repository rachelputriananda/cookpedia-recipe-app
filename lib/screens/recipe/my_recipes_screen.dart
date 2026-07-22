import 'package:flutter/material.dart';

class MyRecipesScreen extends StatefulWidget {
  const MyRecipesScreen({super.key});

  @override
  State<MyRecipesScreen> createState() => _MyRecipesScreenState();
}

class _MyRecipesScreenState extends State<MyRecipesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Data Dummy untuk Resep Draft (No. 46)
  final List<Map<String, String>> _draftRecipes = [
    {
      'title': 'Vegetable Fruit Salad Simple Rec...',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&q=80',
    },
    {
      'title': 'Original Burger & Special French Fri...',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
    },
    {
      'title': 'Seasoned Fried Shrimp Seafood ...',
      'image': 'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
    },
    {
      'title': 'Tuna, Salmon and Sour Vinegar Sushi',
      'image': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500&q=80',
    },
    {
      'title': 'Original Burger & Special French Fri...',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
    },
    {
      'title': 'Original Burger & Special French Fri...',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&q=80',
    },
  ];

  // Data Dummy untuk Resep Published (No. 47)
  final List<Map<String, String>> _publishedRecipes = [
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
    {
      'title': 'Chicken Noodles with Vegetables ...',
      'image': 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80',
    },
    {
      'title': 'Chicken Noodles with Vegetables ...',
      'image': 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=500&q=80',
    },
  ];

  @override
  void initWith() {
    super.initState();
  }

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
        automaticallyImplyLeading: false, // Menghilangkan tombol back karena ini menu utama navbar
        title: Row(
          children: [
            // Logo kecil di sebelah kiri title (sesuai figma)
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
              'My Recipes',
              style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF181A20)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Color(0xFF181A20)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        // Bagian Tab Navigasi: Draft & Published
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFFF4D4D),
          indicatorWeight: 3,
          labelColor: const Color(0xFFFF4D4D),
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          tabs: [
            Tab(text: 'Draft (24)'),
            Tab(text: 'Published (125)'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tampilan Grid untuk Draft (No. 46)
          _buildRecipeGrid(_draftRecipes),

          // Tampilan Grid untuk Published (No. 47)
          _buildRecipeGrid(_publishedRecipes),
        ],
      ),
    );
  }

  // Widget Builder Reusable untuk Grid Resep biar rapi
  Widget _buildRecipeGrid(List<Map<String, String>> recipes) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.85, // Mengatur proporsi tinggi kotak resep
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Gambar latar belakang resep
              Image.network(
                recipe['image']!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: Colors.grey[200]);
                },
              ),
              // Efek gradasi hitam transparan di bagian bawah teks biar terbaca
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              // Teks Judul Resep
              Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: Text(
                  recipe['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Tombol Edit Mini Merah di Pojok Kanan Atas (Ciri Khas Halaman My Recipes)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF4D4D),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 14,
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
