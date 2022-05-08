import 'package:flutter/material.dart';

class ICard extends StatelessWidget {
  final Widget child;
  final double height;
  final double elevation;
  final String? title;

  const ICard({
    Key? key,
    required this.child,
    this.height = 300,
    this.elevation = 0.5,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Container(
        height: height,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (title != null) // 卡片标题
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            child, // 实际内容
          ],
        ),
      ),
    );
  }
}
