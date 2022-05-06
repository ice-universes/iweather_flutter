import 'package:iweather_flutter/utils/weather/handler/handler.dart';
import 'package:iweather_flutter/utils/weather/models/aqi.dart';
import 'package:iweather_flutter/utils/weather/models/weatherInfo.dart';
import 'package:iweather_flutter/utils/location/coord.dart';
import 'package:iweather_flutter/utils/weather/models/astronomy.dart';
import 'package:iweather_flutter/utils/weather/models/warings.dart';
import 'package:iweather_flutter/utils/weather/models/precipitation.dart';

typedef Op = OpenWeatherHandler;

class OpenWeatherHandler extends Handler {
  static Air airHandler(Map<String, dynamic> map) {
    return Air(
      aqi: map['main']['aqi'],
      dt: map['dt'],
      components: Components(
        co: map['components']['co'],
        pm10: map['components']['pm10'],
        pm2p5: map['components']['pm2_5'],
        no2: map['components']['no2'],
        so2: map['components']['so2'],
        o3: map['components']['o3'],
        nh3: map['components']['nh3'],
        no: map['components']['no'],
      ),
    );
  }

  // 预警处理
  static List<WaringItem> waringsHandler(List<dynamic> list) {
    return list
        .map<WaringItem>(
          (e) => WaringItem(
            type: e['type'],
            sender: e['sender_name'],
            event: e['event'],
            start: e['start'],
            end: e['end'],
            description: e['description'],
          ),
        )
        .toList();
  }

  static WeatherInfoItem weatherInfoItemHandler(Map<String, dynamic> map) {
    return WeatherInfoItem(
      dt: map['dt'],
      id: map['weather'][0]['id'],
      description: map['weather'][0]['description'],
      icon: map['weather'][0]['icon'],
      wind: Wind(
        speed: map['wind_speed'],
        gust: map['wind_gust'],
        deg: map['wind_deg'],
      ),
      visibility: map['visibility'],
      clouds: map['clouds'],
      uvIndex: map['uvi'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      grndLevel: map['gradLevel'],
      seaLevel: map['seaLevel'],
      pop: map['pop'],
    );
  }

  // 逐日处理
  static List<WeatherInfoItem> dailyHandler(List<dynamic> list) {
    return list.map<WeatherInfoItem>((e) {
      WeatherInfoItem w = weatherInfoItemHandler(e);

      w.moon = Moon(
        mr: e['moonrise'],
        ms: e['moonset'],
        moonPhase: e['moon_phase'],
      );

      w.sun = Sun(
        sr: e['sunrise'],
        ss: e['sunset'],
      );

      w.temp = TempuratureItem(
        dewPoint: e['dew_point'],
        temp: e['temp']['day'],
        eve: e['temp']['eve'],
        night: e['temp']['night'],
        morn: e['temp']['morn'],
        maxTemp: e['temp']['max'],
        minTemp: e['temp']['min'],
        feelsLike: e['feels_like']['day'],
        feelsLikeEve: e['feels_like']['eve'],
        feelsLikeNight: e['feels_like']['night'],
        feelsLikeMorn: e['feels_like']['morn'],
      );

      if (e['rain'] != null) {
        w.rain = Rain(p: PrecipItem(precipitation: e['rain']));
      }

      if (e['snow'] != null) {
        w.snow = Snow(p: PrecipItem(precipitation: e['snow']));
      }

      return w;
    }).toList();
  }

  // 当前天气
  static WeatherInfoItem currentHandler(Map<String, dynamic> map) {
    WeatherInfoItem w = weatherInfoItemHandler(map);

    w.temp = TempuratureItem(
      dewPoint: map['dew_point'],
      temp: map['temp'],
      feelsLike: map['feels_like'],
    );

    w.sun = Sun(
      sr: map['sunrise'],
      ss: map['sunset'],
    );

    return w;
  }

  // 逐时处理
  static List<WeatherInfoItem> hourlyHandler(List<dynamic> list) {
    return list.map<WeatherInfoItem>((e) {
      WeatherInfoItem w = weatherInfoItemHandler(e);

      w.temp = TempuratureItem(
        dewPoint: e['dew_point'],
        temp: e['temp'],
        feelsLike: e['feels_like'],
      );

      if (e['rain'] != null) {
        w.rain = Rain(o: e['rain']['1h']);
      }

      if (e['snow'] != null) {
        w.snow = Snow(o: e['snow']['1h']);
      }

      return w;
    }).toList();
  }

  static WeatherInfo weatherInfoHandler(Map<String, dynamic> map) {
    return WeatherInfo(
      currentHandler(map['current']),
      coord: Coord(latitude: map['lat'], longitude: map['lon']),
      hourly: hourlyHandler(map['hourly'] ?? []),
      daily: dailyHandler(map['daily'] ?? []),
      warings: waringsHandler(map['alerts'] ?? []),
    );
  }
}
