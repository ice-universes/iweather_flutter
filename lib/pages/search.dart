import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/store/controller.dart';
import 'package:iweather_flutter/components/custom/IButton/ITextButton.dart';
import 'package:iweather_flutter/components/custom/IScaffold.dart';
import 'package:iweather_flutter/components/cities/search_textfield.dart';
import 'package:iweather_flutter/components/cities/suggestions_.dart';

// 城市搜索
class SearchPage extends StatelessWidget {
  final Controller c = Get.find<Controller>();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IScaffold(
      title: SearchTextField(), // 搜索框
      actions: [
        // 搜索输入框取消按钮
        ITextButton(
          child: const Text('取消'),
          onPressed: () {},
        )
      ],
      body: const CitiesList(),
    );
  }
}
