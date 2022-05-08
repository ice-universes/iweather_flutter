import 'package:flutter/material.dart';
import 'package:iweather_flutter/components/custom/IPanel.dart';
import 'package:iweather_flutter/components/chart/weather_background.dart';

class IBar extends StatelessWidget {
  final bool? isVisible; // 是否展示
  final Function()? onTap; // 点击事件
  final String title;
  final String subTitle;
  final String rightInfo; // 右边信息
  final Icon? icon; // 标题旁边的图标
  final String? type;

  const IBar({
    Key? key,
    this.isVisible = false,
    this.onTap,
    required this.title,
    required this.subTitle,
    required this.rightInfo,
    required this.type,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible!,
      child: Ink(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap, // 点击
          child: Stack(
            children: [
              WeatherBackGround(type: type), // 背景图
              IPanel(
                title: title,
                subTitle: subTitle,
                icon: icon,
                rightInfo: rightInfo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
