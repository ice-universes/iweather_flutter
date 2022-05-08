import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/store/controller.dart';
import 'package:iweather_flutter/utils/weather/models/weatherInfo.dart';
import 'package:iweather_flutter/components/custom/ILoading.dart';
import 'package:iweather_flutter/components/IMain.dart';
import 'package:iweather_flutter/components/chart/weather_background.dart';
import 'package:iweather_flutter/components/IHour.dart' show IHours;
import 'package:iweather_flutter/components/IDay.dart' show IDays;
import 'package:iweather_flutter/routers/index.dart';
import 'package:iweather_flutter/components/custom/ISliverBar.dart';

// 首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = Get.find<Controller>();

  @override
  void initState() {
    super.initState();
    controller.updateWeatherInfo(); // 请求天气数据
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: controller,
      builder: (_) => const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final controller = Get.find<Controller>();
  int trans = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: controller,
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            const WeatherBackGround(),
            if (!controller.isReady) const ILoading(), // 是否展示加载动画
            scrollView(),
          ],
        ),
      ),
    );
  }

  // 可滚动首页
  Widget scrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        ISliverBar(
          backgroundColor: Color.fromARGB(trans, 255, 255, 255),
          navBarTitle: Text(
            controller.location,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            // 导航栏左侧图标
            icon: const Icon(Icons.add),
            onPressed: () {
              // 跳转城市管理页面
              Get.toNamed(Routers.cityPage);
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              if (controller.isReady) display(controller.weatherInfo!),
            ],
          ),
        )
      ],
    );
  }

  // 首页信息展示
  Widget display(WeatherInfo weatherInfo) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          MainInfo(
            temperature: weatherInfo.current.temp?.temp ?? 0,
            feelsLike: weatherInfo.current.temp?.feelsLike ?? 0,
            description: weatherInfo.current.description,
            air: weatherInfo.air,
            warings: weatherInfo.warings,
          ),
          IHours(hourly: weatherInfo.hourly!),
          IDays(daily: weatherInfo.daily!),
        ],
      ),
    );
  }
}
