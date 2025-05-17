import 'package:driving_license_exam/component/appbar.dart';
import 'package:flutter/material.dart';

class StudyMaterialsScreen extends StatelessWidget {
  const StudyMaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categories = [
      {
        "title": "Alertness",
        "lessons": 15,
        "icon": Icons.visibility,
        "borderColor": Colors.orange
      },
      {
        "title": "Attitude",
        "lessons": 13,
        "icon": Icons.emoji_emotions,
        "borderColor": Colors.indigo
      },
      {
        "title": "Hazard Awareness",
        "lessons": 15,
        "icon": Icons.warning_amber,
        "borderColor": Colors.red
      },
      {
        "title": "Safety Procedures",
        "lessons": 20,
        "icon": Icons.shield,
        "borderColor": Colors.green
      },
      {
        "title": "Equipment Operation",
        "lessons": 7,
        "icon": Icons.construction,
        "borderColor": Colors.amber
      },
      {
        "title": "Emergency Response",
        "lessons": 15,
        "icon": Icons.health_and_safety,
        "borderColor": Colors.deepOrange
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          // Header
          appbar(
              size: size,
              bgcolor: const Color(0xff28A164),
              textColor: Colors.white,
              heading: 'STUDY  MATERIALS'),
          // Search
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Explore categories to enhance your knowledge"),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search study materials...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Featured Banner
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.asset('assets/images/studymaterial.png',
                          // height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent
                            ],
                            begin: Alignment.center,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xff219EBC),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: const Text(
                                'Featured ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            const Text(
                              'Complete Safety Training',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Categories",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          // Category Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to lesson list
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: category['borderColor'] as Color, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(category['icon'] as IconData, size: 28),
                          const SizedBox(height: 8),
                          Text(
                            category['title'] as String,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text("${category['lessons']} lessons",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
