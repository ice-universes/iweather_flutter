import 'package:flutter/material.dart';

class IList extends StatelessWidget {
  final List<Widget> children;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final double itemExtent;

  const IList({
    Key? key,
    this.children = const <Widget>[],
    this.scrollDirection = Axis.horizontal, // 默认水平方向
    this.shrinkWrap = true, // 根据子组件大小确定 ListView 大小
    this.itemExtent = 80, // 子组件的高度(在展开方向上)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        itemExtent: itemExtent,
        shrinkWrap: shrinkWrap,
        scrollDirection: scrollDirection,
        children: children,
      ),
    );
  }
}
