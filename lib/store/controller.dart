import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/utils/weather/models/weatherInfo.dart';
import 'package:iweather_flutter/utils/weather/openWeather.dart';
import 'package:iweather_flutter/utils/location/coord.dart';

// 全局状态管理
class Controller extends GetxController {
  late bool isReady;
  WeatherInfo? weatherInfo;

  Controller({this.isReady = false});

  // 更新天气信息
  Future<WeatherInfo> updateWeatherInfo() async {
    Coord coord = Coord(latitude: 21, longitude: 110);

    return openWeather.allWeatherInfo(coord).then((value) {
      debugPrint('获取天气数据成功...');
      weatherInfo = value;
      isReady = true;
      update();

      return weatherInfo!;
    });
  }
}
