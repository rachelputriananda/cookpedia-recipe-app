import 'package:flutter/material.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _cookTimeController = TextEditingController();
  final TextEditingController _servesController = TextEditingController();
  final TextEditingController _originController = TextEditingController();

  List<String> ingredients = [''];
  List<Map<String, dynamic>> instructions = [
    {'text': '', 'images': <String>[]}
  ];

  // Objek pendukung untuk memunculkan menu melayang di atas AppBar
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _hideCustomDropdown();
    _titleController.dispose();
    _descController.dispose();
    _cookTimeController.dispose();
    _servesController.dispose();
    _originController.dispose();
    super.dispose();
  }

  // Fungsi untuk menyembunyikan kotak putih jika klik di tempat lain
  void _hideCustomDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // FUNGSI UTAMA: Memunculkan Kotak Putih "Delete Recipe" Persis Seperti Figma
  void _showCustomDropdown() {
    if (_overlayEntry != null) {
      _hideCustomDropdown();
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 150,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(-110, 40), // Mengatur posisi kotak putih agar pas di bawah titik 3
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: const Icon(Icons.delete_outline, color: Colors.black87, size: 18),
                title: const Text(
                  'Delete Recipe',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                onTap: () {
                  _hideCustomDropdown();
                  _showDeleteConfirmationModal(); // Pemicu Modal No. 45
                },
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  // Fungsi untuk memicu Bottom Sheet Konfirmasi Hapus (No. 45)
  void _showDeleteConfirmationModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Delete Recipe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFF4D4D)),
              ),
              const SizedBox(height: 12),
              const Divider(color: Color(0xFFF1F1F1)),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to delete this recipe?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF181A20)),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFF0F0),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                        ),
                        child: const Text('Cancel', style: TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup modal
                          Navigator.pop(context); // Kembali ke halaman sebelumnya
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D4D),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                        ),
                        child: const Text('Yes, Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideCustomDropdown, // Tutup kotak dropdown otomatis jika klik area luar form
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF181A20)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Create Recipe', style: TextStyle(color: Color(0xFF181A20), fontWeight: FontWeight.bold, fontSize: 18)),
          actions: [
            // Tombol Save
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Recipe saved successfully as draft!')),
                );
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4D4D),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ),
            const SizedBox(width: 6),

            // Tombol Publish
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Recipe published successfully!')),
                );
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFF4D4D)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text('Publish', style: TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ),

            // Tombol Titik Tiga (No. 44) menggunakan CompositedTransformTarget agar posisi presisi
            CompositedTransformTarget(
              link: _layerLink,
              child: IconButton(
                icon: const Icon(Icons.more_horiz, color: Color(0xFF181A20)),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                constraints: const BoxConstraints(),
                onPressed: _showCustomDropdown, // Pemicu munculnya kotak putih melayang
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Cover Image Section
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 48, color: Colors.grey[400]),
                    const SizedBox(height: 8),
                    Text('Add recipe cover image', style: TextStyle(color: Colors.grey[500], fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2. Form Input Fields
              _buildSectionTitle('Title'),
              _buildTextField(_titleController, 'Recipe Title'),

              _buildSectionTitle('Description'),
              _buildTextField(_descController, 'Lorem ipsum dolor sit amet ...', maxLines: 3),

              _buildSectionTitle('Cook Time'),
              _buildTextField(_cookTimeController, '1 hour, 30 mins, etc'),

              _buildSectionTitle('Serves'),
              _buildTextField(_servesController, '3 people'),

              _buildSectionTitle('Origin'),
              _buildTextField(_originController, 'Location', icon: Icons.location_on_outlined),

              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF1F1F1), thickness: 1),
              const SizedBox(height: 16),

              // 3. Ingredients Section
              _buildSectionTitle('Ingredients:'),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const Icon(Icons.drag_handle, color: Colors.grey, size: 20),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: const Color(0xFFFFF0F0),
                        child: Text('${index + 1}', style: const TextStyle(color: Color(0xFFFF4D4D), fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          onChanged: (val) => ingredients[index] = val,
                          decoration: InputDecoration(
                            hintText: 'Ingredients ${index + 1}',
                            filled: true,
                            fillColor: const Color(0xFFFAFAFA),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.grey),
                        onPressed: () {
                          if (ingredients.length > 1) {
                            setState(() => ingredients.removeAt(index));
                          }
                        },
                      )
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildAddButton('+ Add Ingredients', () {
                setState(() => ingredients.add(''));
              }),

              const SizedBox(height: 16),
              const Divider(color: Color(0xFFF1F1F1), thickness: 1),
              const SizedBox(height: 16),

              // 4. Instructions Section
              _buildSectionTitle('Instructions:'),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: instructions.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.drag_handle, color: Colors.grey, size: 20),
                          const SizedBox(width: 8),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: const Color(0xFFFFF0F0),
                            child: Text('${index + 1}', style: const TextStyle(color: Color(0xFFFF4D4D), fontSize: 11, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              onChanged: (val) => instructions[index]['text'] = val,
                              decoration: InputDecoration(
                                hintText: 'Instructions ${index + 1}',
                                filled: true,
                                fillColor: const Color(0xFFFAFAFA),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.grey),
                            onPressed: () {
                              if (instructions.length > 1) {
                                setState(() => instructions.removeAt(index));
                              }
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 44.0),
                        child: Row(
                          children: List.generate(3, (imgIndex) {
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image_outlined, size: 18, color: Colors.grey),
                                  SizedBox(height: 4),
                                  Text('Add image', style: TextStyle(color: Colors.grey, fontSize: 8)),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildAddButton('+ Add Instructions:', () {
                setState(() => instructions.add({'text': '', 'images': <String>[]}));
              }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 14.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF181A20)),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 1, IconData? icon}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFFAFAFA),
        suffixIcon: icon != null ? Icon(icon, color: Colors.grey, size: 20) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  Widget _buildAddButton(String label, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFF0F0),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Text(label, style: const TextStyle(color: Color(0xFFFF4D4D), fontWeight: FontWeight.bold, fontSize: 14)),
      ),
    );
  }
}
