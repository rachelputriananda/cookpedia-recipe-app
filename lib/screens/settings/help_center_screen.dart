import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _activeCategory = 'General';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
        title: const Text('Help Center', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFFF4D4D),
          labelColor: const Color(0xFFFF4D4D),
          unselectedLabelColor: Colors.grey,
          tabs: const [Tab(text: 'FAQ'), Tab(text: 'Contact us')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFAQTab(),
          _buildContactUsTab(),
        ],
      ),
    );
  }

  Widget _buildFAQTab() {
    final categories = ['General', 'Account', 'Service', 'Cooking'];
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        // Category Pills
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, idx) {
              bool isSelected = _activeCategory == categories[idx];
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(categories[idx]),
                  selected: isSelected,
                  selectedColor: const Color(0xFFFF4D4D),
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(color: isSelected ? Colors.white : const Color(0xFFFF4D4D), fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFFF4D4D)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onSelected: (val) => setState(() => _activeCategory = categories[idx]),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        // Search Input Component
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: const Icon(Icons.tune, color: Color(0xFFFF4D4D)),
            filled: true,
            fillColor: const Color(0xFFFAFAFA),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 24),

        // Accordion Component
        _buildAccordion('What is Cookpedia?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
        _buildAccordion('Is the Cookpedia App free?', 'Yes, Cookpedia is free to download and use with optional premium features.'),
        _buildAccordion('How do I publish a recipe?', 'Go to dashboard and click creation button.'),
        _buildAccordion('How can I log out from Cookpedia?', 'Navigate to profile setting and find logout option.'),
      ],
    );
  }

  Widget _buildAccordion(String title, String body) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF181A20))),
          iconColor: const Color(0xFFFF4D4D),
          collapsedIconColor: const Color(0xFFFF4D4D),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text(body, style: TextStyle(color: Colors.grey[700], height: 1.4)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactUsTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildContactTile(Icons.headset_mic, 'Contact us', const Color(0xFFFF4D4D)),
        _buildContactTile(Icons.chat, 'WhatsApp', const Color(0xFF25D366)),
        _buildContactTile(Icons.camera_alt, 'Instagram', const Color(0xFFE1306C)),
        _buildContactTile(Icons.facebook, 'Facebook', const Color(0xFF1877F2)),
        _buildContactTile(Icons.alternate_email, 'Twitter', const Color(0xFF1DA1F2)),
        _buildContactTile(Icons.language, 'Website', const Color(0xFFFF4D4D)),
      ],
    );
  }

  Widget _buildContactTile(IconData icon, String title, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F1)),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
