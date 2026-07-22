import 'package:flutter/material.dart';
import '../../models/dietary_item.dart';
import 'complete_profile_screen.dart';

class DietaryPreferencesScreen extends StatefulWidget {
  const DietaryPreferencesScreen({super.key});

  @override
  State<DietaryPreferencesScreen> createState() => _DietaryPreferencesScreenState();
}

class _DietaryPreferencesScreenState extends State<DietaryPreferencesScreen> {
  final List<DietaryItem> _dietaries = [
    DietaryItem(name: 'Vegetarian', emoji: '🥦'),
    DietaryItem(name: 'Vegan', emoji: '🥬'),
    DietaryItem(name: 'Gluten-free', emoji: '🌾'),
    DietaryItem(name: 'Nut-free', emoji: '🌰'),
    DietaryItem(name: 'Dairy-free', emoji: '🧀'),
    DietaryItem(name: 'Low-carb', emoji: '🥗'),
    DietaryItem(name: 'Peanut-free', emoji: '🥜'),
    DietaryItem(name: 'Keto', emoji: '🥑'),
    DietaryItem(name: 'Soy-free', emoji: '🫘'),
    DietaryItem(name: 'Raw food', emoji: '🥗'),
  ];

  final Set<String> _selectedDietaries = {};

  void _nextStep() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CompleteProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonActive = _selectedDietaries.isNotEmpty;

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
            value: 0.8,
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
                'Do you have any dietary\npreferences? ⚙️',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.2),
              ),
              const SizedBox(height: 12),
              const Text('Select your dietary preferences for better recommendations, or you can skip it.', style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 2.3,
                  ),
                  itemCount: _dietaries.length,
                  itemBuilder: (context, index) {
                    final item = _dietaries[index];
                    final isSelected = _selectedDietaries.contains(item.name);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedDietaries.remove(item.name);
                          } else {
                            _selectedDietaries.add(item.name);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected ? const Color(0xFFFF4D4D) : Colors.grey.shade200,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 20))),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
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
