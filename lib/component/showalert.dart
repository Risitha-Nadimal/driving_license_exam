import 'package:flutter/material.dart';

void showAttemptAllAnswersDialog(
  BuildContext context, {
  required VoidCallback onFinishPressed,
  required int unansweredCount,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/alert_exam.png',
              height: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Attempt all answers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              unansweredCount > 0
                  ? 'You have $unansweredCount unanswered questions. Are you sure you want to finish?'
                  : 'Are you ready to submit your exam?',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2979FF),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  onFinishPressed(); // Execute finish action
                },
                child:
                    Text(unansweredCount > 0 ? 'FINISH ANYWAY' : 'SUBMIT EXAM'),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text('REVIEW ANSWERS'),
            ),
          ],
        ),
      );
    },
  );
}
