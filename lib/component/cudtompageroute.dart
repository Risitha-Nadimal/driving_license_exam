import 'package:driving_license_exam/previous_result_study.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page, required PreviousResultStudy child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child
                .animate()
                .fadeIn(
                  duration: 300.ms,
                  curve: Curves.easeInOut,
                )
                .slideX(
                  begin: 0.5,
                  end: 0.0,
                  duration: 300.ms,
                  curve: Curves.easeInOut,
                );
          },
        );
}
