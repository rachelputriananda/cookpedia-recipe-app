import 'package:flutter/material.dart';
import '../../models/cuisine_item.dart';
import 'dietary_preferences_screen.dart';

class SelectCuisinesScreen extends StatefulWidget {
  const SelectCuisinesScreen({super.key});

  @override
  State<SelectCuisinesScreen> createState() => _SelectCuisinesScreenState();
}

class _SelectCuisinesScreenState extends State<SelectCuisinesScreen> {
  final List<CuisineItem> _cuisines = [
    CuisineItem(name: 'Salad', emoji: '🥗'),
    CuisineItem(name: 'Egg', emoji: '🍳'),
    CuisineItem(name: 'Soup', emoji: '🍲'),
    CuisineItem(name: 'Meat', emoji: '🍖'),
    CuisineItem(name: 'Chicken', emoji: '🍗'),
    CuisineItem(name: 'Seafood', emoji: '🦐'),
    CuisineItem(name: 'Burger', emoji: '🍔'),
    CuisineItem(name: 'Pizza', emoji: '🍕'),
    CuisineItem(name: 'Sushi', emoji: '🍣'),
    CuisineItem(name: 'Rice', emoji: '🍚'),
    CuisineItem(name: 'Bread', emoji: '🍞'),
    CuisineItem(name: 'Fruit', emoji: '🍎'),
  ];

  final Set<String> _selectedCuisines = {};

  void _nextStep() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DietaryPreferencesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonActive = _selectedCuisines.isNotEmpty;

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
            value: 0.6,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF4D4D)),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select your cuisines\npreferences 🥘',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.2),
              ),
              const SizedBox(height: 12),
              const Text('Select your cuisines preferences for better recommendations, or you can skip it.', style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: _cuisines.length,
                  itemBuilder: (context, index) {
                    final item = _cuisines[index];
                    final isSelected = _selectedCuisines.contains(item.name);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedCuisines.remove(item.name);
                          } else {
                            _selectedCuisines.add(item.name);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? const Color(0xFFFF4D4D) : Colors.grey.shade200,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.emoji, style: const TextStyle(fontSize: 36)),
                            const SizedBox(height: 8),
                            Text(item.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _nextStep,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFF0F0),
                          foregroundColor: const Color(0xFFFF4D4D),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 0,
                        ),
                        child: const Text('Skip', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: isButtonActive ? _nextStep : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D4D),
                          disabledBackgroundColor: const Color(0xFFC84040),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 0,
                        ),
                        child: const Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
