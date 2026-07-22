import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  int selectedFilter = 0; // 0: Top, 1: Newest, 2: Oldest
  final TextEditingController _commentController = TextEditingController();

  // Variabel untuk memicu munculnya keyboard tiruan di Web
  bool showKeyboard = false;

  final List<Map<String, dynamic>> _comments = [
    {
      'name': 'Lauralee Quintero',
      'avatar': 'https://i.pravatar.cc/100?img=20',
      'comment': 'Loving this recipe! So many delicious recipes to choose from ❤️❤️❤️',
      'likes': 356,
      'time': '1 month ago',
      'isLiked': true,
    },
    {
      'name': 'Benny Spanbauer',
      'avatar': 'https://i.pravatar.cc/100?img=12',
      'comment': 'Makes salad planning a breeze. I can easily find recipes based on ingredients I have on hand 🥗',
      'likes': 283,
      'time': '2 months ago',
      'isLiked': false,
    },
    {
      'name': 'Janetta Rotolo',
      'avatar': 'https://i.pravatar.cc/100?img=32',
      'comment': 'Step-by-step instructions and photos make it easy to follow along and cook amazing salad 🔥🔥',
      'likes': 194,
      'time': '2 weeks ago',
      'isLiked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF181A20)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Comments (125)',
          style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter Chips (Top, Newest, Oldest)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                _buildFilterChip(0, 'Top'),
                const SizedBox(width: 10),
                _buildFilterChip(1, 'Newest'),
                const SizedBox(width: 10),
                _buildFilterChip(2, 'Oldest'),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Comments List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _comments.length,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final item = _comments[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 18, backgroundImage: NetworkImage(item['avatar'])),
                        const SizedBox(width: 10),
                        Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF181A20))),
                        const Spacer(),
                        const Icon(Icons.more_horiz, color: Colors.grey, size: 20),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left: 46.0),
                      child: Text(
                        item['comment'],
                        style: const TextStyle(color: Color(0xFF181A20), fontSize: 13, height: 1.35),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Comment Input Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -2)),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=5')),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(22),
                        // Border otomatis merah kalau kolom diklik (Sesuai nomor 41)
                        border: showKeyboard ? Border.all(color: const Color(0xFFFF4D4D)) : null,
                      ),
                      child: TextField(
                        controller: _commentController,
                        onTap: () {
                          setState(() {
                            showKeyboard = true; // Munculkan keyboard tiruan pas diklik
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Add a comment...',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send_rounded, color: Color(0xFFFF4D4D)),
                    onPressed: () {
                      setState(() {
                        showKeyboard = false; // Sembunyikan keyboard saat kirim
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // EMULASI KEYBOARD INTERAKTIF UNTUK TAMPILAN WEB (Bisa Diketik)
          if (showKeyboard)
            Container(
              width: double.infinity,
              height: 240,
              color: const Color(0xFFD1D5DB),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Baris 1
                  _buildKeyboardRow(['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P']),
                  // Baris 2
                  _buildKeyboardRow(['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L']),
                  // Baris 3 (Dengan Backspace Fungsional)
                  Row(
                    children: [
                      const Expanded(child: Icon(Icons.arrow_upward, size: 18, color: Colors.black87)),
                      Expanded(flex: 8, child: _buildKeyboardRow(['Z', 'X', 'C', 'V', 'B', 'N', 'M'])),
                      // Tombol Hapus (Backspace)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_commentController.text.isNotEmpty) {
                                _commentController.text = _commentController.text.substring(0, _commentController.text.length - 1);
                                _updateCursorPosition();
                              }
                            });
                          },
                          child: const Icon(Icons.backspace_outlined, size: 18, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  // Baris 4 (Dengan Spacebar Fungsional)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(5)),
                        child: const Text('123', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 6),
                      // Tombol Spasi (Spacebar)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _commentController.text += ' ';
                              _updateCursorPosition();
                            });
                          },
                          child: Container(
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 1, offset: const Offset(0, 1))],
                            ),
                            child: const Center(child: Text('space', style: TextStyle(color: Colors.black54, fontSize: 13))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Tombol Selesai / Tutup Keyboard
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showKeyboard = false;
                          });
                        },
                        child: Container(
                          width: 65,
                          height: 38,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(5)),
                          child: const Text('Go', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(int index, String label) {
    bool isSelected = selectedFilter == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF4D4D) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFF4D4D)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFFFF4D4D),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                // Tambahkan huruf kecil ke TextField
                _commentController.text += key.toLowerCase();
                _updateCursorPosition();
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 1, offset: const Offset(0, 1)),
                ],
              ),
              child: Center(
                child: Text(
                  key,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Fungsi pembantu agar kursor textfield tidak lompat ke depan saat mengetik
  void _updateCursorPosition() {
    _commentController.selection = TextSelection.fromPosition(
      TextPosition(offset: _commentController.text.length),
    );
  }
}
