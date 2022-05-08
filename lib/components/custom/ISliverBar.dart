import 'package:flutter/material.dart';

class ISliverBar extends StatelessWidget {
  final Widget? flexibletitle;
  final Widget? navBarTitle;
  final Widget? navBarbackground;
  final Widget? leading;
  final double? expandedHeight;
  final double? elevation;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final TextStyle titleTextStyle;
  final bool? centerTitle;

  const ISliverBar({
    Key? key,
    this.navBarTitle,
    this.flexibletitle,
    this.leading,
    this.navBarbackground,
    this.expandedHeight,
    this.elevation = 0, // 默认无阴影
    this.centerTitle = true, // 默认标题居中
    this.backgroundColor = Colors.transparent,
    // 默认白色图标
    this.iconTheme = const IconThemeData(color: Colors.white),
    // 默认白色标题
    this.titleTextStyle = const TextStyle(color: Colors.white),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: navBarTitle,
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent, // 透明背景
      expandedHeight: expandedHeight, // 展开高度
      elevation: elevation,
      iconTheme: iconTheme,
      titleTextStyle: titleTextStyle,
      pinned: true, // 固定到顶部
      flexibleSpace: FlexibleSpaceBar(
        background: navBarbackground,
        title: flexibletitle,
        centerTitle: centerTitle,
        collapseMode: CollapseMode.pin,
      ),
      leading: leading,
    );
  }
}
