import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final Color beginColor;
  final Color endColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  const CustomOutlinedButton({
    super.key,
    this.containerWidth = 46,
    this.containerHeight = 22,
    this.borderRadius = 4,
    this.beginColor = const Color(0xFF171C20),
    this.endColor = const Color(0xFF43484C),
    this.width = 46,
    this.height = 22,
    required this.onPressed,
    this.text = '完成',
    this.textColor = Colors.white,
    this.textFontSize = 12,
    this.textFontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [beginColor, endColor],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(textColor),
          side: WidgetStateProperty.all(BorderSide.none),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, double.infinity),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: textFontSize, fontWeight: textFontWeight),
        ),
      ),
    );
  }
}
