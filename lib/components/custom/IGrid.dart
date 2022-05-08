import 'package:flutter/material.dart';

class IGrid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double childAspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const IGrid({
    Key? key,
    this.children = const <Widget>[],
    this.crossAxisCount = 3, // 横轴元素个数
    this.mainAxisSpacing = 5, // 水平组件间间隙
    this.crossAxisSpacing = 5, // 垂直组件间间隙
    this.childAspectRatio = 1.5, // 子组件宽高比
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
          ),
          children: children,
        ),
      ),
    );
  }
}
