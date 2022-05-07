import 'package:flutter/material.dart';

// 加载组件...
class ILoading extends StatefulWidget {
  const ILoading({Key? key}) : super(key: key);

  @override
  State<ILoading> createState() => ILaodingState();
}

class ILaodingState extends State<ILoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
