import 'package:driving_license_exam/component/PreviousButton.dart';
import 'package:driving_license_exam/component/nextbutton.dart';
import 'package:driving_license_exam/mock_result_screen.dart';
import 'package:flutter/material.dart';

class MockExamDo extends StatefulWidget {
  const MockExamDo({super.key});

  @override
  State<MockExamDo> createState() => _MockExamDoState();
}

class _MockExamDoState extends State<MockExamDo> {
  int selectedAnswer = -1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final answers = [
      "Curve to right",
      "Joining a side road at right angles to the right",
      "Stop sign ahead",
      "Slippery road",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0C1A64),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                //
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            color: Colors.white70, size: 18),
                        SizedBox(width: 6),
                        Text("Time Remaining :",
                            style:
                                TextStyle(color: Color.fromARGB(179, 0, 0, 0))),
                        Spacer(),
                        Text("49:25",
                            style: TextStyle(
                                color: Color(0xFF219EBC),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text("Question 22/50",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 16)),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 22 / 50,
                      minHeight: 8,
                      backgroundColor: Color.fromARGB(60, 1, 1, 1),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
              // Timer & Progress

              const SizedBox(height: 24),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("What does this traffic sign indicate?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Image.asset(
                        'assets/images/exam.png', // Add your traffic sign image in assets
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Select the correct answer below:",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14)),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Question & Image
              Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: const Color(0xFF0C1A64),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ...List.generate(answers.length, (index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: selectedAnswer == index
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                                ),
                                color: selectedAnswer == index
                                    ? Colors.blue.shade50
                                    : Colors.white,
                              ),
                              child: RadioListTile<int>(
                                value: index,
                                groupValue: selectedAnswer,
                                onChanged: (value) {
                                  setState(() {
                                    selectedAnswer = value!;
                                  });
                                },
                                title: Text(answers[index]),
                                activeColor: Colors.blue,
                              ),
                            );
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              // Navigation buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PreviousButton(),
                  NextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MockResultScreen(
                            totalQuestions: 50,
                            correctAnswers: 36,
                          ),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
