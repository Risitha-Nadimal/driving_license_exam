import 'package:driving_license_exam/component/backbutton.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final String source;
  final List<int> userAnswers;
  final List<Map<String, dynamic>> questions;

  const ReviewScreen({
    super.key,
    required this.source,
    required this.userAnswers,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0C1A64),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar

            const SizedBox(height: 24),
            // Questions List
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, qIndex) {
                  final question = questions[qIndex];
                  final userAnswer = userAnswers[qIndex];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Question ${qIndex + 1}: ${question['question']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (question['image'] != null)
                          Center(
                            child: Image.asset(
                              question['image'],
                              height: 100,
                            ),
                          ),
                        const SizedBox(height: 16),
                        const Text(
                          "Answers:",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        // Answer Options
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: question['answers'].length,
                          itemBuilder: (context, aIndex) {
                            final answer = question['answers'][aIndex];
                            final isCorrect =
                                aIndex == question['correctAnswer'];
                            final isUserAnswer = aIndex == userAnswer;
                            bool showIndicator;

                            if (source == 'StudyMaterials') {
                              // Show correct/wrong for all answers
                              showIndicator = true;
                            } else {
                              // MockExam: Show indicator only for user's answer
                              showIndicator = isUserAnswer;
                            }

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isUserAnswer
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                                ),
                                color: showIndicator && isCorrect
                                    ? Colors.green.shade50
                                    : showIndicator &&
                                            isUserAnswer &&
                                            !isCorrect
                                        ? Colors.red.shade50
                                        : isUserAnswer
                                            ? Colors.blue.shade50
                                            : Colors.white,
                              ),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(answer),
                                    ),
                                    if (showIndicator)
                                      Icon(
                                        isCorrect ? Icons.check : Icons.close,
                                        color: isCorrect
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            backbutton(size: size)
            // Back Button
          ],
        ),
      ),
    );
  }
}

// Assuming CustomButton is defined elsewhere; if not, here's a simple implementation
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.grey,
        foregroundColor: textColor ?? Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text),
    );
  }
}
