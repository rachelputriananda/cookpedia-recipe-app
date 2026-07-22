import 'package:flutter/material.dart';
import '../chefs/chef_profile_screen.dart';
import 'comments_screen.dart';
import 'create_recipe_screen.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool isBookmarked = false;
  bool showBookmarkToast = false;
  bool isFollowing = false;

  final List<String> _ingredients = const [
    '1 head of lettuce, chopped 🥬',
    '1 large carrot, grated 🥕',
    '1 large cucumber, sliced 🥒',
    '1 large apple, chopped 🍎',
    '1 cup of cherry tomatoes, halved 🍅',
    '1/2 cup of raisins 🍇',
    '1/2 cup of crumbled feta cheese 🧀',
    '1/4 cup of balsamic vinaigrette 🏺',
  ];

  final List<Map<String, dynamic>> _instructions = const [
    {
      'step': 1,
      'text': 'In a large salad bowl, combine the chopped lettuce, grated carrot, sliced cucumber, chopped apple, cherry tomatoes, and raisins.',
      'images': [
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=300',
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=300',
      ]
    },
    {
      'step': 2,
      'text': 'Sprinkle the feta cheese over the top of the salad.',
      'images': [
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=300',
        'https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=300',
      ]
    },
    {
      'step': 3,
      'text': 'Drizzle the balsamic vinaigrette over the salad and toss to combine.',
      'images': [
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=300',
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=300',
      ]
    },
    {
      'step': 4,
      'text': 'Serve and enjoy!',
      'images': [
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=300',
        'https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=300',
      ]
    },
  ];

  final List<Map<String, String>> _moreRecipes = const [
    {'title': 'Vegetable and\nFruit Green Salad', 'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=500'},
    {'title': 'Fresh Seasoned\nVegetable Salad', 'image': 'https://images.unsplash.com/photo-1515543237350-b3eea1ec8082?w=500'},
  ];

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      if (isBookmarked) {
        showBookmarkToast = true;
      }
    });

    if (isBookmarked) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            showBookmarkToast = false;
          });
        }
      });
    }
  }

  void _showShareModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 16),
              const Text('Share', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
              const SizedBox(height: 24),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
                children: [
                  _buildShareOption(Icons.chat, 'WhatsApp', const Color(0xFF25D366)),
                  _buildShareOption(Icons.flutter_dash, 'Twitter', const Color(0xFF1DA1F2)),
                  _buildShareOption(Icons.facebook, 'Facebook', const Color(0xFF1877F2)),
                  _buildShareOption(Icons.camera_alt, 'Instagram', const Color(0xFFE4405F)),
                  _buildShareOption(Icons.mail, 'Yahoo', const Color(0xFF6001D2)),
                  _buildShareOption(Icons.music_note, 'TikTok', Colors.black),
                  _buildShareOption(Icons.message, 'Chat', const Color(0xFFFF4D4D)),
                  _buildShareOption(Icons.wechat, 'WeChat', const Color(0xFF07C160)),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOption(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(color: color.withOpacity(0.12), shape: BoxShape.circle),
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black87)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Cover Image & App Bar Overlay
                Stack(
                  children: [
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black38,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: isBookmarked ? const Color(0xFFFF4D4D) : Colors.black38,
                                  child: IconButton(
                                    icon: Icon(
                                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                                      color: Colors.white,
                                    ),
                                    onPressed: _toggleBookmark,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  backgroundColor: Colors.black38,
                                  child: IconButton(
                                    icon: const Icon(Icons.send_outlined, color: Colors.white),
                                    onPressed: _showShareModal,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  backgroundColor: Colors.black38,
                                  child: IconButton(
                                    icon: const Icon(Icons.more_horiz_rounded, color: Colors.white),
                                    onPressed: _showShareModal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Image Page Indicator Dots
                    Positioned(
                      bottom: 12,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 16, height: 4, decoration: BoxDecoration(color: const Color(0xFFFF4D4D), borderRadius: BorderRadius.circular(2))),
                          const SizedBox(width: 4),
                          Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.white54, shape: BoxShape.circle)),
                          const SizedBox(width: 4),
                          Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.white54, shape: BoxShape.circle)),
                          const SizedBox(width: 4),
                          Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.white54, shape: BoxShape.circle)),
                        ],
                      ),
                    ),
                  ],
                ),

                // Title & Author Section
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Vegetable & Fruit Salad\nwith Balsamic Dressing',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF181A20), height: 1.25),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChefProfileScreen(
                                    chefName: 'Jane Cooper',
                                    handle: '@jane_cooper',
                                    avatarUrl: 'https://i.pravatar.cc/100?img=1',
                                  ),
                                ),
                              );
                            },
                            child: const CircleAvatar(radius: 22, backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=1')),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Jane Cooper', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF181A20))),
                                SizedBox(height: 2),
                                Text('@jane_cooper', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isFollowing = !isFollowing;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isFollowing ? Colors.white : const Color(0xFFFF4D4D),
                              elevation: 0,
                              side: isFollowing ? const BorderSide(color: Color(0xFFFF4D4D)) : BorderSide.none,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                            ),
                            child: Text(
                              isFollowing ? 'Following' : 'Follow',
                              style: TextStyle(color: isFollowing ? const Color(0xFFFF4D4D) : Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'This salad is a healthy and delicious combination of fresh vegetables and fruit with a tangy balsamic dressing. Feel free to add or substitute any ingredients to suit your taste.',
                        style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
                      ),
                      const SizedBox(height: 20),

                      // Recipe Specs Cards (Time, Servings, Origin)
                      Row(
                        children: [
                          _buildSpecCard(Icons.access_time, '10 mins', 'cook time'),
                          const SizedBox(width: 12),
                          _buildSpecCard(Icons.person_outline, '1 serving', 'serves'),
                          const SizedBox(width: 12),
                          _buildSpecCard(Icons.location_on_outlined, 'USA', 'origin'),
                        ],
                      ),
                      const SizedBox(height: 28),

                      // Ingredients
                      const Text('Ingredients:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
                      const SizedBox(height: 12),
                      ..._ingredients.asMap().entries.map(
                            (entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${entry.key + 1}', style: const TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold, fontSize: 13)),
                              const SizedBox(width: 12),
                              Expanded(child: Text(entry.value, style: const TextStyle(fontSize: 13, color: Colors.black87))),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Instructions
                      const Text('Instructions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
                      const SizedBox(height: 14),
                      ..._instructions.map((item) => _buildInstructionItem(item)),

                      const SizedBox(height: 20),

                      // Comments Section Card (Clicking navigates to CommentsScreen No. 40)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CommentsScreen()),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Comments (125)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
                                Icon(Icons.arrow_forward, color: Color(0xFFFF4D4D), size: 20),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildCommentPreview(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // More Recipes Like This
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('More Recipes Like This', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward, color: Color(0xFFFF4D4D), size: 20),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CreateRecipeScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _moreRecipes.length,
                          itemBuilder: (context, index) {
                            final item = _moreRecipes[index];
                            return Container(
                              width: 150,
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
                                    left: 12,
                                    right: 12,
                                    bottom: 12,
                                    child: Text(
                                      item['title']!,
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13, height: 1.2),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 38. "Added to Bookmark" Toast Popup
          if (showBookmarkToast)
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFFF4D4D).withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(color: Color(0xFFFF4D4D), shape: BoxShape.circle),
                        child: const Icon(Icons.check, color: Colors.white, size: 14),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Added to Bookmark',
                        style: TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSpecCard(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF0F0),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: const Color(0xFFFF4D4D), size: 16),
                const SizedBox(width: 4),
                Text(title, style: const TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 2),
            Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(Map<String, dynamic> item) {
    final List<String> images = item['images'];
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item['step']}', style: const TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold, fontSize: 14)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(item['text'], style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.35)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: images
                .map(
                  (img) => Container(
                width: 90,
                height: 70,
                margin: const EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=20')),
            const SizedBox(width: 10),
            const Text('Lauralee Quintero', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF181A20))),
            const Spacer(),
            IconButton(icon: const Icon(Icons.more_horiz, color: Colors.grey, size: 20), onPressed: () {}),
          ],
        ),
        const Text(
          'Loving this recipe! So many delicious recipes to choose from ❤️❤️❤️',
          style: TextStyle(color: Colors.black87, fontSize: 12, height: 1.3),
        ),
        const SizedBox(height: 6),
        Row(
          children: const [
            Icon(Icons.favorite, color: Color(0xFFFF4D4D), size: 14),
            SizedBox(width: 4),
            Text('356', style: TextStyle(color: Colors.grey, fontSize: 11)),
            SizedBox(width: 12),
            Text('1 month ago', style: TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ],
    );
  }
}
