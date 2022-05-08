import 'package:flutter/material.dart';

/// +-------------------------+
/// +  title icon             +
/// +               rightInfo +
/// +  subTitle               +
/// +-------------------------+

class IPanel extends StatelessWidget {
  const IPanel({
    Key? key,
    required this.subTitle,
    required this.rightInfo,
    required this.title,
    this.icon,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String rightInfo; // 右边信息
  final Icon? icon; // 标题旁边的图标

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    title, // 主标题
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (icon != null) // 图标
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: icon,
                    ),
                ],
              ),
              Row(
                children: [
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            rightInfo, // 右边信息
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
