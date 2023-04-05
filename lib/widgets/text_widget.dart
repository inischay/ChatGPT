import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final double fonsize;
  final Color? color;
  final FontWeight? fontWeight;
  const TextWidget(
      {super.key,
      required this.label,
      this.fonsize = 18,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fonsize,
          fontWeight: fontWeight ?? FontWeight.w500),
    );
  }
}
