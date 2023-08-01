import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'glassmorphism.dart';

class GlassButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double fontSize;
  final VoidCallback onTap;

  const GlassButton({
    required this.width,
    required this.height,
    required this.text,
    required this.fontSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Glassmorphism(
            blur: 20,
            opacity: 0.1,
            radius: 5.r,
            child: Container(
              width: width,
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
