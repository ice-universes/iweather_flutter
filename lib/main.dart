import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/routers/index.dart';
import 'package:iweather_flutter/store/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());

    return GetMaterialApp(
      title: '小冰天气',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/", // 默认路由
      getPages: Routers.getPage(),
    );
  }
}
