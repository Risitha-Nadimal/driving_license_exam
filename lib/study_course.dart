import 'package:flutter/material.dart';

class StudyCourseScreen extends StatelessWidget {
  final Size size;
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

  StudyCourseScreen({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom AppBar
          AppBar(
            size: size,
            bgcolor: const Color(0xff28A164),
            textColor: Colors.white,
            heading: 'STUDY COURSE',
          ),

          // Lesson List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return Card(
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
                      // Handle tap action here
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Custom AppBar Widget
class AppBar extends StatelessWidget {
  final Size size;
  final Color bgcolor;
  final Color textColor;
  final String heading;

  const AppBar({
    super.key,
    required this.size,
    required this.bgcolor,
    required this.textColor,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 60,
      color: bgcolor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading,
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
