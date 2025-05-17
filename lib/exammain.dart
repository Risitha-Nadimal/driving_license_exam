import 'package:driving_license_exam/component/appbar.dart';
import 'package:driving_license_exam/languageselction.dart';
import 'package:flutter/material.dart';

class MockExamScreen extends StatelessWidget {
  const MockExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar(
                size: size,
                bgcolor: const Color(0xff4378DB),
                textColor: const Color.fromARGB(255, 255, 255, 255),
                heading: "MOCK EXAM"),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/mockexam.png', // replace with actual image path
                        height: size.height * 0.25,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Exam Information
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mock Exam Information',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffCCE7FE),
                                    ),
                                    child: const Icon(Icons.question_mark,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  const SizedBox(width: 8),
                                  const InfoTile(
                                      label: 'Total Question',
                                      value: '50 \n Questions'),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffCCE7FE),
                                    ),
                                    child: const Icon(Icons.access_time_rounded,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  const SizedBox(width: 8),
                                  const InfoTile(
                                      label: 'Duration', value: '60 Minutes'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffCCE7FE),
                                    ),
                                    child: const Icon(Icons.check_circle,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  const SizedBox(width: 8),
                                  const InfoTile(
                                      label: 'Passing Score',
                                      value: '45/50\n(86%)'),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xffCCE7FE),
                                    ),
                                    child: const Icon(Icons.replay,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  const SizedBox(width: 8),
                                  const InfoTile(
                                      label: 'Attempts', value: 'Unlimited'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Available Mock Tests',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    // Exam Paper 1
                    ExamCard(
                      title: 'Exam Paper 1',
                      questions: '30 Questions',
                      duration: '60 Minutes',
                      description:
                          'Covers traffic signs, road rules, and basic driving regulations.',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LanguageSelectionScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),

                    // Exam Paper 2
                    ExamCard(
                      title: 'Exam Paper 2',
                      questions: '35 Questions',
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
    return Container(
      width: double.infinity, // Takes full screen width
      margin:
          const EdgeInsets.symmetric(vertical: 10), // Add some vertical spacing
      child: Card(
        color: const Color(0xFFF4FAFF),
        elevation: 4, // Adds shadow
        shadowColor: Colors.blue.withOpacity(0.5), // Custom shadow color
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Colors.blue.shade200, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                '$questions  •  $duration',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 6),
              Text(description),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity, // Makes button full width
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4378DB),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Start Exam',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
