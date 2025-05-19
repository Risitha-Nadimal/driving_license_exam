import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  //final String buttonText;
  final double widthPercentage;
  final bool isLastQuestion;

  const NextButton({
    super.key,
    this.onPressed,
    // this.buttonText = "Next",
    this.widthPercentage = 0.3,
    required this.isLastQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Align(
        alignment: Alignment.centerRight, // Align to right instead of left
        child: Container(
          width: MediaQuery.of(context).size.width * widthPercentage,
          decoration: BoxDecoration(
            color: Colors.blueAccent, // Use blueAccent as background
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Center(
            child: TextButton.icon(
              onPressed: onPressed,
              icon: Text(
                isLastQuestion ? 'Finish' : 'Next',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white, // White text
                ),
              ),
              label: Icon(
                isLastQuestion ? Icons.done_all : Icons.arrow_forward_ios,
                color: Colors.white, // White icon
              ),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                // No need for foregroundColor since we set text/icon colors directly
              ),
            ),
          ),
        ),
      ),
    );
  }
}
