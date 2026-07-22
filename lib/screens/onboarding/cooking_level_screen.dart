import 'package:flutter/material.dart';
import '../../models/cooking_level.dart';
import 'select_cuisines_screen.dart';

class CookingLevelScreen extends StatefulWidget {
  const CookingLevelScreen({super.key});

  @override
  State<CookingLevelScreen> createState() => _CookingLevelScreenState();
}

class _CookingLevelScreenState extends State<CookingLevelScreen> {
  final List<CookingLevel> _levels = [
    CookingLevel(
      title: 'Novice',
      description: 'Basic understanding of kitchen tools and basic cooking techniques such as boiling and frying.',
    ),
    CookingLevel(
      title: 'Intermediate',
      description: 'Ability to follow recipes, prepare simple dishes, and basic knife skills.',
    ),
    CookingLevel(
      title: 'Advanced',
      description: 'Understanding of cooking principles, create recipes, & proficiency in various techniques.',
    ),
    CookingLevel(
      title: 'Professional',
      description: 'Professional culinary experience or formal training in cooking arts.',
    ),
  ];

  CookingLevel? _selectedLevel;

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
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: 0.4,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF4D4D)),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is your cooking\nlevel? 🍳',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text('Please select your cooking level for a better recommendations.'),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _levels.length,
                  itemBuilder: (context, index) {
                    final level = _levels[index];
                    final isSelected = _selectedLevel == level;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedLevel = level),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? const Color(0xFFFF4D4D) : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(level.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(level.description, style: const TextStyle(color: Colors.black54, fontSize: 13)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _selectedLevel != null
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectCuisinesScreen()),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D4D),
                    disabledBackgroundColor: const Color(0xFFC84040),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
