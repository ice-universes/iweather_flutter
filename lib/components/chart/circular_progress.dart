import 'package:flutter/material.dart';

// 环形进度条(这里先占个坑, 到时候改成半环形的...)
class CircularProgress extends StatelessWidget {
  final double value;
  final Color? backgroundColor;
  final Color? valueColor;
  final double strokeWidth;

  const CircularProgress({
    Key? key,
    required this.value,
    this.backgroundColor = const Color(0xFFEBEEF5),
    this.valueColor = const Color(0xFF2196F3),
    this.strokeWidth = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: backgroundColor,
      valueColor: AlwaysStoppedAnimation<Color>(valueColor!),
      strokeWidth: strokeWidth,
      value: value,
    );
  }
}
