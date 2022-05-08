import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/store/controller.dart';
import 'package:iweather_flutter/components/cities/search_button.dart';
import 'package:iweather_flutter/components/custom/IScaffold.dart';

// 城市管理
class CityPage extends StatelessWidget {
  final Controller controller = Get.find<Controller>();

  CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              '城市管理',
              style: TextStyle(fontSize: 30),
            ),
            SearchButton(), // 搜索框
          ],
        ),
      ),
    );
  }
}
