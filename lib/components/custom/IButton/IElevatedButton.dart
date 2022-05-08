import 'package:flutter/material.dart';

// 主要用于城市列表的 button...
class IElevatedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final double? elevation;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? height;

  const IElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.height = 50,
    this.elevation = 0,
    this.borderRadius = 100,
    this.backgroundColor = const Color(0xfff5f5f5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
