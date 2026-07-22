import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final bool isEmpty;

  const NotificationScreen({super.key, this.isEmpty = false});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFFF4D4D),
          indicatorWeight: 3,
          labelColor: const Color(0xFFFF4D4D),
          unselectedLabelColor: Colors.grey.shade400,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          tabs: const [
            Tab(text: 'General'),
            Tab(text: 'System'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          widget.isEmpty ? _buildEmptyGeneralNotification() : _buildGeneralNotificationList(),
          _buildSystemNotificationList(),
        ],
      ),
    );
  }

  Widget _buildEmptyGeneralNotification() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 160,
            height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: -0.15,
                  child: Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 12,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF4D4D),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Empty', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF181A20))),
          const SizedBox(height: 8),
          const Text('You don\'t have any notification at this time', style: TextStyle(fontSize: 13, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildGeneralNotificationList() {
    final List<Map<String, String>> items = [
      {
        'name': 'Jane Cooper',
        'action': 'has published a new recipe!',
        'time': 'Today | 09:24 AM',
        'avatar': 'https://i.pravatar.cc/100?img=1',
        'thumb': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=200',
      },
      {
        'name': 'Rochel',
        'action': 'has commented on your recipe',
        'time': '1 day ago | 14:43 PM',
        'avatar': 'https://i.pravatar.cc/100?img=2',
        'thumb': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200',
      },
      {
        'name': 'Brad Wigington',
        'action': 'liked your comment',
        'time': '1 day ago | 09:29 AM',
        'avatar': 'https://i.pravatar.cc/100?img=2',
        'thumb': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200',
      },
      {
        'name': 'Tyra Ballentine',
        'action': 'has published a new recipe!',
        'time': '2 days ago | 10:29 AM',
        'avatar': 'https://i.pravatar.cc/100?img=2',
        'thumb': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200',
      },
      {
        'name': 'Marci Winkles',
        'action': 'has published a new recipe!',
        'time': '3 days ago | 16:52 PM',
        'avatar': 'https://i.pravatar.cc/100?img=2',
        'thumb': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200',
      },
      {
        'name': 'Aileen',
        'action': 'has commented on your recipe',
        'time': '4 days ago | 14:27 PM',
        'avatar': 'https://i.pravatar.cc/100?img=2',
        'thumb': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200',
      },
      {
        'name': 'George',
        'action': 'has commented on your recipe',
        'time': '6 days ago | 09:20 AM',
        'avatar': 'https://i.pravatar.cc/100?img=2',
        'thumb': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=200',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(item['avatar']!),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                        children: [
                          TextSpan(text: '${item['name']} ', style: const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: item['action']),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(item['time']!, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(item['thumb']!, width: 48, height: 48, fit: BoxFit.cover),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSystemNotificationList() {
    final List<Map<String, dynamic>> systemItems = [
      {
        'title': 'Security Updates!',
        'time': 'Today | 09:24 AM',
        'desc': 'Now Cookpedia has a Two-Factor Authentication. Try it now to make your account more secure.',
        'icon': Icons.verified_user,
        'iconColor': Colors.blue,
        'bgColor': Colors.blue.shade50,
        'isNew': true,
      },
      {
        'title': 'Bookmark Feature Available!',
        'time': '1 day ago | 14:43 PM',
        'desc': 'Now you can add your favorite reccipes to bookmarks, You can access it through the home page -> my bookmark',
        'icon': Icons.bookmark_remove_rounded,
        'iconColor': Colors.orange,
        'bgColor': Colors.blue.shade50,
        'isNew': true,
      },
      {
        'title': 'New Updates Available!',
        'time': '2 days ago | 10:29 AM',
        'desc': 'Update Cookpedia now to get access to the latest features for easier in buying ebook.',
        'icon': Icons.perm_device_info_rounded,
        'iconColor': Colors.deepPurpleAccent,
        'bgColor': Colors.blue.shade50,
        'isNew': false,
      },
      {
        'title': 'Your Storage IS Almost Full!',
        'time': '5 days ago | 16:52 PM',
        'desc': 'Your Storage IS Almost Full. Delete some items to make more space.',
        'icon': Icons.folder_rounded,
        'iconColor': Colors.red,
        'bgColor': Colors.blue.shade50,
        'isNew': false,
      },
      {
        'title': 'Account Setup Successfull!',
        'time': '12 Dec, 2022 | 14:27 PM',
        'desc': 'Your account creation is succesful, you can now experience our services.',
        'icon': Icons.person,
        'iconColor': Colors.green,
        'bgColor': Colors.blue.shade50,
        'isNew': false,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: systemItems.length,
      itemBuilder: (context, index) {
        final item = systemItems[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(color: item['bgColor'], shape: BoxShape.circle),
                    child: Icon(item['icon'], color: item['iconColor'], size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF181A20))),
                        const SizedBox(height: 2),
                        Text(item['time'], style: const TextStyle(fontSize: 11, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 48.0),
                child: Text(item['desc'], style: const TextStyle(fontSize: 12, color: Colors.black54, height: 1.4)),
              ),
            ],
          ),
        );
      },
    );
  }
}
