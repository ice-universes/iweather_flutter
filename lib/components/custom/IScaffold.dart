import 'package:flutter/material.dart';

// 因为两个页面都需要这种样式的脚手架, 因此封装起来...
class IScaffold extends StatelessWidget {
  final Widget body;
  final Widget? title;
  final Widget? leading;
  final Color? appBarBackgroundColor;
  final Color? bodyBackgroundColor;
  final IconThemeData? iconThemeData;
  final double? elevation;
  final List<Widget>? actions;

  const IScaffold({
    Key? key,
    required this.body,
    this.title,
    this.leading,
    this.actions,
    // 导航栏图标默认黑色
    this.iconThemeData = const IconThemeData(color: Colors.black),
    this.elevation = 0, // 导航栏默认无海拔(阴影)
    // 导航栏默认为透明
    this.appBarBackgroundColor = Colors.transparent,
    // 程序整体默认为白色
    this.bodyBackgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        elevation: elevation,
        backgroundColor: appBarBackgroundColor,
        iconTheme: iconThemeData,
        title: title,
        leading: leading,
        actions: actions,
      ),
      body: body,
    );
  }
}
