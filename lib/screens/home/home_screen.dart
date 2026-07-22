import 'package:flutter/material.dart';
import '../discover/discover_view.dart';
import 'home_content_view.dart';
import '../profile/profile_screen.dart';
import '../recipe/my_recipes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Halaman yang ditampilkan berdasarkan tab Bottom Navigation Bar
  final List<Widget> _pages = [
    const HomeContentView(), // Tab 0: Home Page Utama (No. 20)
    const DiscoverView(),    // Tab 1: Discover Page (No. 25)
    const SizedBox(),        // Tab 2: Tombol (+)
    const MyRecipesScreen(),  // Tab 3: My Recipes / Bookmark (No. 24)
    const ProfileScreen(),        // Tab 4: Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFFFF4D4D),
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          onTap: (index) {
            if (index != 2) { // Abaikan tombol (+) di tengah
              setState(() => _currentIndex = index);
            }
          },
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Discover'),
            BottomNavigationBarItem(
              icon: Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF4D4D),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 24),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'My Recipes'),
            const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
