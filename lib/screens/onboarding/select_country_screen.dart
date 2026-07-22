import 'package:flutter/material.dart';
import '../../models/country.dart';
import 'cooking_level_screen.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  final List<Country> _allCountries = [
    Country(name: 'Afghanistan', code: 'AF', flagEmoji: '🇦🇫'),
    Country(name: 'Albania', code: 'AL', flagEmoji: '🇦🇱'),
    Country(name: 'Algeria', code: 'DZ', flagEmoji: '🇩🇿'),
    Country(name: 'United States', code: 'US', flagEmoji: '🇺🇸'),
    Country(name: 'Indonesia', code: 'ID', flagEmoji: '🇮🇩'),
  ];

  Country? _selectedCountry;

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
            value: 0.2,
            minHeight: 8,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF4D4D)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Which country are you\nfrom? 🏳️',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _allCountries.length,
                itemBuilder: (context, index) {
                  final country = _allCountries[index];
                  final isSelected = _selectedCountry == country;
                  return ListTile(
                    tileColor: isSelected ? Colors.red.shade50 : Colors.transparent,
                    title: Text('${country.flagEmoji}  ${country.name}'),
                    onTap: () => setState(() => _selectedCountry = country),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _selectedCountry != null
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CookingLevelScreen()),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D4D),
                  disabledBackgroundColor: const Color(0xFFC84040),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
