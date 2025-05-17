import 'package:driving_license_exam/component/appbar.dart';
import 'package:driving_license_exam/component/backbutton.dart';
import 'package:flutter/material.dart';

class PreviousResultStudy extends StatefulWidget {
  const PreviousResultStudy({super.key});

  @override
  State<PreviousResultStudy> createState() => _PreviousResultStudyState();
}

class _PreviousResultStudyState extends State<PreviousResultStudy> {
  final List<Map<String, dynamic>> results = const [
    {
      'title': 'Safety Procedures',
      'lesson': 'Lesson 01',
      'date': 'May 6, 2025',
      'duration': '60 Minutes',
      'correct': '44 of 50 answer correctly',
      'status': 'Pass'
    },
    {
      'title': 'Emergency Response',
      'lesson': 'Lesson 04',
      'date': 'May 6, 2025',
      'duration': '60 Minutes',
      'correct': '44 of 50 answer correctly',
      'status': 'Pass'
    },
    {
      'title': 'Emergency Response',
      'lesson': 'Lesson 04',
      'date': 'May 6, 2025',
      'duration': '60 Minutes',
      'correct': '25 of 50 answer correctly',
      'status': 'Fail'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          // Header
          appbar(
            textColor: Colors.white,
            size: size,
            bgcolor: const Color(0xFF28A164),
            heading: "Previous Result",
          ),
          const SizedBox(height: 16),
          // List of result cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results[index];
                final isPass = item['status'] == 'Pass';

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(item['lesson'],
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 16)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(item['date'],
                              style: const TextStyle(fontSize: 13)),
                          const SizedBox(width: 10),
                          Text(item['duration'],
                              style: const TextStyle(fontSize: 13)),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 8),
                            decoration: BoxDecoration(
                              color: isPass ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item['status'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 0),
                      Text(item['correct'],
                          style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                );
              },
            ),
          ),
          // Back button
          backbutton(size: size),
        ],
      ),
    );
  }
}
