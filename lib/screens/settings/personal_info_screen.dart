import 'package:flutter/material.dart';
import '../../models/country.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181A20)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Personal Info', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.edit_note, color: Color(0xFF181A20), size: 28), onPressed: () {}),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&q=80'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: Color(0xFFFF4D4D), shape: BoxShape.circle),
                      child: const Icon(Icons.edit, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildInfoField('Full Name', 'Andrew Ainsley'),
            _buildInfoField('Email', 'andrew.ainsley@yourdomain.com'),
            _buildInfoField('Phone Number', '+1-300-555-0399'),
            _buildInfoField('Gender', 'Male', isDropdown: true),
            _buildInfoField('Date of Birth', '12/27/1995', isCalendar: true),
            _buildInfoField('Street Address', '3517 W. Gray Street, New York'),
            _buildInfoField('Country', 'United States'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value, {bool isDropdown = false, bool isCalendar = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
          TextFormField(
            initialValue: value,
            readOnly: isDropdown || isCalendar,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF181A20)),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF4D4D), width: 1.5)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFF4D4D), width: 2)),
              suffixIcon: isDropdown
                  ? const Icon(Icons.keyboard_arrow_down, color: Color(0xFFFF4D4D))
                  : isCalendar ? const Icon(Icons.calendar_month, color: Color(0xFFFF4D4D)) : null,
            ),
          ),
        ],
      ),
    );
  }
}
