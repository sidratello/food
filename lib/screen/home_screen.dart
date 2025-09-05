import 'package:flutter/material.dart';

import 'menu_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final List<Map<String, String>> allCategories = [
  {
    "title": "Menu",
    "image": "assets/example.jpg",
    "color": "#E53935",
  },
  {
    "title": "Cake",
    "image": "assets/example.jpg",
    "color": "#F596BF",
  },
  {
    "title": "No Sugar",
    "image": "assets/example.jpg",
    "color": "#E53935",
  },
  {
    "title": "Fast Meals",
    "image": "assets/example.jpg",
    "color": "#FF596BF",
  },
];
class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredCategories = [];
  void initState() {
    super.initState();
    filteredCategories = List.from(allCategories); // في البداية نعرض الكل
  }
  void _filterCategories(String query) {
    final results = allCategories.where((item) {
      final title = item['title']!.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredCategories = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){}, icon:  Icon(Icons.arrow_back), color: Colors.black),
        title: const Text('Menu'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              onChanged: _filterCategories,
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: filteredCategories.length,
                itemBuilder: (context, index) {
                  final item = filteredCategories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuScreen()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 140,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item['image']!),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), // شفافية فوق الصورة
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            // النصوص فوق الصورة
                            Positioned(
                              left: 20,
                              top: 20,
                              child: Text(
                                item['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // إذا كان في subtitle، تقدر تضيفه هنا تحت العنوان
                            // Positioned(
                            //   left: 20,
                            //   top: 50,
                            //   child: Text(
                            //     item['subtitle']!,
                            //     style: const TextStyle(
                            //       color: Colors.white70,
                            //       fontSize: 16,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
