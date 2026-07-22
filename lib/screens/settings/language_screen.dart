import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLang = 'English (US)';

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
        title: const Text('Language', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text('Suggested', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          _buildRadioTile('English (US)'),
          _buildRadioTile('English (UK)'),
          const Divider(color: Color(0xFFF1F1F1)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text('Language', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          _buildRadioTile('Mandarin'),
          _buildRadioTile('Spanish'),
          _buildRadioTile('French'),
          _buildRadioTile('Arabic'),
          _buildRadioTile('Bengali'),
          _buildRadioTile('Russian'),
          _buildRadioTile('Japanese'),
          _buildRadioTile('Korean'),
          _buildRadioTile('Indonesia'),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String lang) {
    return RadioListTile<String>(
      contentPadding: EdgeInsets.zero,
      title: Text(lang, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      value: lang,
      groupValue: _selectedLang,
      activeColor: const Color(0xFFFF4D4D),
      controlAffinity: ListTileControlAffinity.trailing,
      onChanged: (val) => setState(() => _selectedLang = val!),
    );
  }
}
