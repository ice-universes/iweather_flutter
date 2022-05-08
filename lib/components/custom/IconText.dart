import 'package:flutter/material.dart';

// 带图标的 Text
class IconText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final IconData? icon;
  final double? size; // 图标大小
  final Color? color; // 颜色

  const IconText(
    this.text, {
    Key? key,
    this.icon,
    this.style,
    this.size,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(text, style: style),
        ),
        Icon(icon, color: color),
      ],
    );
  }
}
