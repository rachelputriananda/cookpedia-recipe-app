import 'package:flutter/material.dart';

class AboutCookpediaScreen extends StatelessWidget {
  const AboutCookpediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listOptions = [
      'Job Vacancy', 'Developer', 'Partner', 'Accessibility',
      'Privacy Policy', 'Community Guidelines', 'Feedback',
      'Rate us', 'Visit Our Website', 'Follow us on Social Media'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181A20)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('About Cookpedia', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEAEA),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(Icons.restaurant_menu, color: Color(0xFFFF4D4D), size: 48),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Cookpedia v5.9.7', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFF1F1F1)),
          Expanded(
            child: ListView.builder(
              itemCount: listOptions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  title: Text(listOptions[index], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                  onTap: () {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
