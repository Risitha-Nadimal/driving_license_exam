import 'package:flutter/material.dart';

class PreviousButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final double widthPercentage;

  const PreviousButton({
    super.key,
    this.onPressed,
    this.buttonText = "Previous",
    this.widthPercentage = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: MediaQuery.of(context).size.width * widthPercentage,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextButton.icon(
            onPressed: onPressed ?? () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            label: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}
