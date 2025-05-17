import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar(
      {super.key,
      required this.size,
      required this.bgcolor,
      required this.textColor,
      required this.heading});

  final Size size;
  final Color bgcolor;
  final String heading;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.15,
          padding: const EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            color: bgcolor,
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  heading,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * 0.01, // Adjust height as needed
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
