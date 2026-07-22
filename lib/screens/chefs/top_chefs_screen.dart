import 'package:flutter/material.dart';
import 'chef_profile_screen.dart';
import '../search/search_screen.dart';

class TopChefsScreen extends StatelessWidget {
  const TopChefsScreen({super.key});

  final List<Map<String, String>> _chefsList = const [
    {'name': 'George', 'handle': '@george_eddings', 'image': 'https://images.unsplash.com/photo-1577219491135-ce391730fb2c?w=500'},
    {'name': 'Natasya', 'handle': '@natasya_chef', 'image': 'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=500'},
    {'name': 'Nathan', 'handle': '@nathan_cooks', 'image': 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=500'},
    {'name': 'Alfredo', 'handle': '@alfredo_pasta', 'image': 'https://images.unsplash.com/photo-1581299894007-aaa50297cf16?w=500'},
    {'name': 'Daniel', 'handle': '@daniel_gourmet', 'image': 'https://images.unsplash.com/photo-1574966740793-9c3f769efb97?w=500'},
    {'name': 'Marielle', 'handle': '@marielle_kitchen', 'image': 'https://images.unsplash.com/photo-1607631568010-a87245c0daf8?w=500'},
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
        title: const Text('Top Chefs', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
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
        itemCount: _chefsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          final chef = _chefsList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChefProfileScreen(
                    chefName: '${chef['name']} Eddings',
                    handle: chef['handle']!,
                    avatarUrl: chef['image']!,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage(chef['image']!), fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 14,
                    child: Text(
                      chef['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
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
