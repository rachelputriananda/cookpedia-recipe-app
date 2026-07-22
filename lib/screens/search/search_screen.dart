import 'package:flutter/material.dart';
import '../chefs/chef_profile_screen.dart';
import '../recipe/recipe_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedTab = 0; // 0: Recipes, 1: People

  List<String> previousSearches = [
    'Classic Lasagna',
    'Spicy Chicken Tacos',
    'Pesto Pasta Salad',
    'Vegetable Stir-Fry',
    'Fettuccine Alfredo',
    'Tomato Basil Soup',
    'Creamy Garlic Shrimp',
    'Chocolate Chip Cookies',
  ];

  final List<Map<String, String>> _searchRecipes = const [
    {
      'title': 'Vegetable & Fruit\nSalad with Balsa...',
      'author': 'Jane Cooper',
      'avatar': 'https://i.pravatar.cc/100?img=1',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500',
    },
    {
      'title': 'Vegetable and\nFruit Green Salad',
      'author': 'Willard Purnell',
      'avatar': 'https://i.pravatar.cc/100?img=15',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500',
    },
    {
      'title': 'Vegetable Lettuce\nSalad with Simpl...',
      'author': 'Clinton McClure',
      'avatar': 'https://i.pravatar.cc/100?img=7',
      'image': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
    },
    {
      'title': 'Fresh Seasoned\nVegetable Salad',
      'author': 'Phyllis Godley',
      'avatar': 'https://i.pravatar.cc/100?img=16',
      'image': 'https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=500',
    },
  ];

  final List<Map<String, dynamic>> _peopleList = [
    {'name': 'Jane Cooper', 'handle': '@jane_cooper', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=1'},
    {'name': 'Merrill Cooper', 'handle': '@merrill_cooper', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=33'},
    {'name': 'Charolette Cooper', 'handle': '@charolette_cooper', 'isFollowing': true, 'avatar': 'https://i.pravatar.cc/100?img=5'},
    {'name': 'Jamel Cooper', 'handle': '@jamel_cooper', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=12'},
    {'name': 'Marielle Cooper', 'handle': '@marielle_cooper', 'isFollowing': true, 'avatar': 'https://i.pravatar.cc/100?img=9'},
    {'name': 'Janetta Cooper', 'handle': '@janetta_cooper', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=16'},
    {'name': 'Krishna Cooper', 'handle': '@krishna_cooper', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=20'},
    {'name': 'Pedro Cooper', 'handle': '@pedro_cooper', 'isFollowing': true, 'avatar': 'https://i.pravatar.cc/100?img=36'},
    {'name': 'Clinton Cooper', 'handle': '@clinton_cooper', 'isFollowing': false, 'avatar': 'https://i.pravatar.cc/100?img=7'},
  ];

  @override
  Widget build(BuildContext context) {
    final text = _searchController.text.trim();
    final isTyping = text.isEmpty;
    final isNotFound = text.toLowerCase().contains('abcd');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: isTyping ? const Color(0xFFFFF0F0) : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
              border: isTyping ? Border.all(color: const Color(0xFFFF4D4D).withOpacity(0.3)) : null,
            ),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              onChanged: (val) {
                setState(() {});
              },
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'Search for Recipes or Chef',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                suffixIcon: text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.close, color: Colors.grey, size: 18),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                )
                    : null,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
      ),
      body: isTyping
          ? _buildTypeKeywordState()
          : Column(
        children: [
          const SizedBox(height: 12),
          _buildSegmentedControl(),
          const SizedBox(height: 12),
          Expanded(
            child: isNotFound
                ? _buildNotFoundState()
                : (_selectedTab == 0 ? _buildRecipesResultState() : _buildPeopleResultState()),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeKeywordState() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Previous Search',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF181A20)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          previousSearches.clear();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...previousSearches.map(
                      (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              previousSearches.remove(item);
                            });
                          },
                          child: const Icon(Icons.close, size: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xFFD1D5DB),
          padding: const EdgeInsets.only(top: 8, bottom: 20, left: 4, right: 4),
          child: Column(
            children: [
              _buildKeyboardRow(['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P']),
              const SizedBox(height: 8),
              _buildKeyboardRow(['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L']),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      height: 42,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(color: const Color(0xFFABB2B9), borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.arrow_upward, color: Colors.black87, size: 18),
                    ),
                  ),
                  ...['Z', 'X', 'C', 'V', 'B', 'N', 'M'].map(
                        (key) => Expanded(
                      flex: 10,
                      child: GestureDetector(
                        onTap: () {
                          _searchController.text += key;
                          _searchController.selection = TextSelection.fromPosition(TextPosition(offset: _searchController.text.length));
                          setState(() {});
                        },
                        child: Container(
                          height: 42,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                          alignment: Alignment.center,
                          child: Text(key, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: GestureDetector(
                      onTap: () {
                        if (_searchController.text.isNotEmpty) {
                          _searchController.text = _searchController.text.substring(0, _searchController.text.length - 1);
                          _searchController.selection = TextSelection.fromPosition(TextPosition(offset: _searchController.text.length));
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 42,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(color: const Color(0xFFABB2B9), borderRadius: BorderRadius.circular(6)),
                        child: const Icon(Icons.backspace_outlined, color: Colors.black87, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: Container(
                      height: 42,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(color: const Color(0xFFABB2B9), borderRadius: BorderRadius.circular(6)),
                      alignment: Alignment.center,
                      child: const Text('123', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Expanded(
                    flex: 60,
                    child: GestureDetector(
                      onTap: () {
                        _searchController.text += ' ';
                        _searchController.selection = TextSelection.fromPosition(TextPosition(offset: _searchController.text.length));
                        setState(() {});
                      },
                      child: Container(
                        height: 42,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                        alignment: Alignment.center,
                        child: const Text('space', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(
                      height: 42,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(color: const Color(0xFFFF4D4D), borderRadius: BorderRadius.circular(6)),
                      child: const Icon(Icons.search, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(padding: EdgeInsets.only(left: 16), child: Icon(Icons.emoji_emotions_outlined, color: Colors.black54, size: 20)),
                  Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.mic, color: Colors.black54, size: 20)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKeyboardRow(List<String> keys) {
    return Row(
      children: keys.map((key) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              _searchController.text += key;
              _searchController.selection = TextSelection.fromPosition(TextPosition(offset: _searchController.text.length));
              setState(() {});
            },
            child: Container(
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
              alignment: Alignment.center,
              child: Text(key, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFF4D4D)),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedTab == 0 ? const Color(0xFFFF4D4D) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Recipes',
                    style: TextStyle(
                      color: _selectedTab == 0 ? Colors.white : const Color(0xFFFF4D4D),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedTab == 1 ? const Color(0xFFFF4D4D) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'People',
                    style: TextStyle(
                      color: _selectedTab == 1 ? Colors.white : const Color(0xFFFF4D4D),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotFoundState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(
              color: Color(0xFFFF4D4D),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.sentiment_dissatisfied, color: Colors.white, size: 90),
          ),
          const SizedBox(height: 32),
          const Text(
            'Not Found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF181A20)),
          ),
          const SizedBox(height: 12),
          const Text(
            'We\'re sorry, the keyword you were looking for could not be found. Please search with another keywords.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildRecipesResultState() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: _searchRecipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final item = _searchRecipes[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecipeDetailScreen(),
              ),
            );
          },
          child: Container(
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
                        Colors.black.withOpacity(0.85),
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
                    child: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 16,
                    ),
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          height: 1.25,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 9,
                            backgroundImage: NetworkImage(item['avatar']!),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              item['author']!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                              ),
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
    );
  }

  Widget _buildPeopleResultState() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: _peopleList.length,
      itemBuilder: (context, index) {
        final person = _peopleList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChefProfileScreen(
                  chefName: person['name'],
                  handle: person['handle'],
                  avatarUrl: person['avatar'],
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(person['avatar']),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(person['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF181A20))),
                      const SizedBox(height: 2),
                      Text(person['handle'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      person['isFollowing'] = !person['isFollowing'];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: person['isFollowing'] ? Colors.white : const Color(0xFFFF4D4D),
                    elevation: 0,
                    side: person['isFollowing'] ? const BorderSide(color: Color(0xFFFF4D4D)) : BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    person['isFollowing'] ? 'Following' : 'Follow',
                    style: TextStyle(
                      color: person['isFollowing'] ? const Color(0xFFFF4D4D) : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
