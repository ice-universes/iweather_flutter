import 'package:flutter/material.dart';

/// +---------------------+
/// +  title subTitle     +
/// +                     +
/// +  value              +
/// +---------------------+

class IContainer extends StatelessWidget {
  final Color? backgroundColor;
  final String title;
  final String? subTitle;
  final num value;

  const IContainer({
    Key? key,
    required this.title,
    required this.value,
    this.subTitle,
    this.backgroundColor = const Color(0xFFEBEEF5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor, // 容器背景色
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 1),
            child: Row(children: [
              Container(
                child: Text(
                  title, // 主标题
                  style: const TextStyle(fontSize: 15),
                ),
                margin: const EdgeInsets.only(right: 1),
              ),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ), // 副标题
            ]),
          ),
          Text(
            '$value', // 数值
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
