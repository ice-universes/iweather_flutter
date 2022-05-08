import 'package:flutter/material.dart';

class ITextButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const ITextButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        splashFactory: NoSplash.splashFactory, // 去掉水波纹
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
