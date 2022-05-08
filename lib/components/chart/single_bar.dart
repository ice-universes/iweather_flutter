import 'package:flutter/material.dart';

class SingleBar extends StatelessWidget {
  final num max;
  final num min;
  final num average;

  const SingleBar({
    Key? key,
    required this.max,
    required this.min,
    required this.average,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // 最高温度
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            "$max°",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Container(
          // 温度
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            "$min°",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
