import 'package:iweather_flutter/utils/weather/models/weatherInfo.dart';
import 'package:iweather_flutter/utils/weather/weather.dart';
import 'package:iweather_flutter/utils/weather/models/aqi.dart';
import 'package:iweather_flutter/utils/http/requests.dart';
import 'package:iweather_flutter/utils/location/coord.dart';
import 'package:iweather_flutter/utils/weather/handler/openWeatherHandler.dart';
import 'package:iweather_flutter/key.dart';

class OpenWeather extends Weather {
  OpenWeather(
    String key, {
    String baseUrl = 'http://api.openweathermap.org/data/2.5',
  }) : super(key, baseUrl);

  // 获取空气质量
  // 文档: https://openweathermap.org/api/air-pollution
  Future<Air> airPollution(Coord coord) async {
    Map<String, dynamic> resp = await requests.get(
      '$baseUrl/air_pollution',
      params: {
        'appid': key,
        'lat': coord.latitude,
        'lon': coord.longitude,
      },
    );

    return Op.airHandler(resp['list'][0]);
  }

  // 空气污染预测
  Future<List<Air>> airPollutionForcast(Coord coord) async {
    Map<String, dynamic> resp = await requests.get(
      '$baseUrl/air_pollution/forecast',
      params: {
        'appid': key,
        'lat': coord.latitude,
        'lon': coord.longitude,
      },
    );

    return resp['list'].map<Air>((e) => Op.airHandler(e)).toList();
  }

  // 空气质量历史数据
  // start/end 为 10 位时间戳
  Future<List<Air>> airPollutionHistory(Coord coord, int start, int end) async {
    Map<String, dynamic> resp = await requests.get(
      '$baseUrl/air_pollution/history',
      params: {
        'appid': key,
        'lat': coord.latitude,
        'lon': coord.longitude,
        'start': start,
        'end': end,
      },
    );

    return resp['list'].map<Air>((e) => Op.airHandler(e)).toList();
  }

  // 一次调用
  // 文档: https://openweathermap.org/api/one-call-api
  Future<WeatherInfo> allWeatherInfo(Coord coord) async {
    Air air = await airPollution(coord);

    Map<String, dynamic> resp = await requests.get(
      '$baseUrl/onecall',
      params: {
        'appid': key,
        'lat': coord.latitude,
        'lon': coord.longitude,
      },
    );

    WeatherInfo w = Op.weatherInfoHandler(resp);

    w.air = air;

    return w;
  }
}

final OpenWeather openWeather = OpenWeather(keys['openWeather']!);
