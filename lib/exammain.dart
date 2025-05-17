import 'package:driving_license_exam/component/appbar.dart';
import 'package:flutter/material.dart';

class MockExamScreen extends StatelessWidget {
  const MockExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFF),
      body: Column(
        children: [
          appbar(
              size: size,
              bgcolor: const Color(0xff4378DB),
              textColor: const Color.fromARGB(255, 255, 255, 255),
              heading: "MOCK EXAM"),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/mockexam.png', // replace with actual image path
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Exam Information
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InfoTile(
                                  label: 'Test Course', value: 'Sri Lanka'),
                              InfoTile(label: 'Duration', value: '60 Minutes'),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InfoTile(label: 'Passing Score', value: '45/50'),
                              InfoTile(label: 'Attempts', value: 'Unlimited'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Available Mock Tests',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Exam Paper 1
                  ExamCard(
                    title: 'Exam Paper 1',
                    questions: '30 Questions',
                    duration: '60 Minutes',
                    description:
                        'Covers traffic signs, road rules, and basic driving.',
                    onPressed: () {
                      // Start Exam 1 logic
                    },
                  ),
                  const SizedBox(height: 10),

                  // Exam Paper 2
                  ExamCard(
                    title: 'Exam Paper 2',
                    questions: '30 Questions',
                    duration: '60 Minutes',
                    description:
                        'Covers signal interpretation, road rules, and more.',
                    onPressed: () {
                      // Start Exam 2 logic
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Info Tile Widget
class InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoTile({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

// Exam Card Widget
class ExamCard extends StatelessWidget {
  final String title;
  final String questions;
  final String duration;
  final String description;
  final VoidCallback onPressed;

  const ExamCard({
    required this.title,
    required this.questions,
    required this.duration,
    required this.description,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue.shade200, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('$questions  •  $duration',
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 6),
            Text(description),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Start Exam'),
            ),
          ],
        ),
      ),
    );
  }
}
