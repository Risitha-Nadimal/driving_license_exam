import 'package:driving_license_exam/component/appbar.dart';
import 'package:driving_license_exam/component/reviewbutton.dart';
import 'package:driving_license_exam/home.dart';
import 'package:flutter/material.dart';

class MockResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;

  const MockResultScreen({
    super.key,
    required this.totalQuestions,
    required this.correctAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int wrongAnswers = totalQuestions - correctAnswers;
    bool isPassed = correctAnswers >= 35;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          appbar(
              size: size,
              bgcolor: const Color(0xff4378DB),
              textColor: Colors.white,
              heading: "Mock Exam \n Exam paper 01"),
          // Header

          const SizedBox(height: 24),
          // Answer Summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _summaryTile("Total Question", totalQuestions.toString()),
                const SizedBox(height: 8),
                _summaryTile("Correct Answer", correctAnswers.toString(),
                    color: Colors.green),
                const SizedBox(height: 8),
                _summaryTile("Wrong Answer", wrongAnswers.toString(),
                    color: Colors.red),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Result Section
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    // Image
                    Image.asset(
                      width: size.width,
                      fit: size.width < 400 ? BoxFit.cover : BoxFit.contain,
                      isPassed
                          ? 'assets/images/pass.png' // use your pass image
                          : 'assets/images/fail.png', // use your fail image
                      // height: size.height,
                    ),
                    const SizedBox(height: 16),
                    Positioned(
                      top: size.height * 0.29,
                      left: size.width * 0.2,
                      right: size.width * 0.2,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              isPassed ? "Congratulations" : "Try Again 😔",
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color:
                                    isPassed ? Colors.green : Colors.redAccent,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              isPassed
                                  ? "You Pass the Exam 🎉"
                                  : "You are Fail the Exam",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () {
                    // Navigate to review
                  },
                  text: 'Review',
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  },
                  text: 'Home',
                  backgroundColor: const Color(0xff4378DB),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryTile(String title, String value, {Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(
          vertical: 4), // Added margin for shadow visibility
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 0, 0, 0), // Slightly muted title color
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
