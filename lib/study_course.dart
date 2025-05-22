import 'package:driving_license_exam/component/appbar.dart';
import 'package:driving_license_exam/component/backbutton.dart';
import 'package:driving_license_exam/component/custompageroute.dart';
import 'package:driving_license_exam/languageselction.dart';
import 'package:flutter/material.dart';

class StudyCourseScreen extends StatelessWidget {
  final Size size;
  final String categoryTitle; // Add this parameter
  final List<Map<String, String>> lessons = [
    {
      "image": "assets/images/dead_end.png",
      "title": "Learner Drivers First Ever Driving Lesson - #1"
    },
    {
      "image": "assets/images/no_entry.png",
      "title":
          "Driving On Busy Main Roads For The First Time - Driving Lesson #2"
    },
    {
      "image": "assets/images/t_junction.png",
      "title": "How To Turn Right At A T Junction - Driving Lesson #3"
    },
    {
      "image": "assets/images/roundabout.png",
      "title": "Learner Drivers First U-Turn - Driving Lesson #4"
    },
    {
      "image": "assets/images/dead_end.png",
      "title": "Learner Drivers First Ever Driving Lesson - #1"
    },
    {
      "image": "assets/images/no_entry.png",
      "title":
          "Driving On Busy Main Roads For The First Time - Driving Lesson #2"
    },
    {
      "image": "assets/images/t_junction.png",
      "title": "How To Turn Right At A T Junction - Driving Lesson #3"
    },
  ];

  // Update constructor to include categoryTitle
  StudyCourseScreen({
    super.key,
    required this.size,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          appbar(
              size: size,
              bgcolor: const Color(0xff28A164),
              textColor: const Color.fromARGB(255, 255, 255, 255),
              heading: categoryTitle), // Use categoryTitle here

          // Lesson List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return Card(
                  color: Colors.white,
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Image.asset(
                      lesson["image"]!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      lesson["title"]!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        createFadeRoute(const LanguageSelectionScreen(
                          source: "StudyMaterials",
                          buttonColor: Color(0xff28A164),
                        )),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          backbutton(size: size)
        ],
      ),
    );
  }
}
