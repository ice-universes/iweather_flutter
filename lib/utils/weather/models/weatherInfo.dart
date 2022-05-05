import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:iweather_flutter/utils/weather/models/astronomy.dart';
import 'package:iweather_flutter/utils/location/coord.dart';
import 'package:iweather_flutter/utils/weather/models/warings.dart';
import 'package:iweather_flutter/utils/weather/models/aqi.dart';
import 'package:iweather_flutter/utils/weather/models/precipitation.dart';

/// metric: m/s
/// units: m/s
/// imperial: mile/h
class Wind {
  late num? speed; // 风速
  late num? deg; // 风向
  late num? gust; // 阵风

  Wind({this.speed, this.deg, this.gust});

  @override
  String toString() {
    return ('# 风速: $speed\n'
        '# 风向: $deg\n'
        '# 阵风: $gust\n');
  }
}

class TempuratureItem {
  /// units: K
  /// metric: ℃
  /// imperial: ℉
  late num? temp;
  late num? maxTemp;
  late num? minTemp;
  late num? night;
  late num? morn;
  late num? eve;
  late num? dewPoint;
  late num? feelsLike;
  late num? feelsLikeMorn;
  late num? feelsLikeEve;
  late num? feelsLikeNight;

  @override
  String toString() {
    return ('# 温度: $temp\n'
        '# 最高温度: $maxTemp\n'
        '# 最低温度: $minTemp\n'
        '# 夜间温度: $night\n'
        '# 早晨温度: $night\n'
        '# 傍晚温度: $eve\n'
        '# 露点温度: $dewPoint\n'
        '# 体感温度: $feelsLike\n'
        '# 早晨体感: $feelsLikeMorn\n'
        '# 傍晚体感: $feelsLikeEve\n'
        '# 夜间体感: $feelsLikeNight\n');
  }

  TempuratureItem({
    this.temp,
    this.eve,
    this.night,
    this.morn,
    this.maxTemp,
    this.minTemp,
    this.dewPoint,
    this.feelsLike,
    this.feelsLikeEve,
    this.feelsLikeNight,
    this.feelsLikeMorn,
  });
}

class WeatherInfoItem {
  late DateTime? dateTime; // 发布时间
  late String? description; // 天气状况
  late num? id;
  late String? icon; // 天气图标
  late Wind? wind;
  late num? visibility; // km
  late num? clouds; // %
  late TempuratureItem? temp;
  late Rain? rain;
  late Snow? snow;
  late num? uvIndex; // 紫外线指数
  late Sun? sun;
  late Moon? moon;
  late num? pop; // 降水概率
  late num? pressure; // 大气压力, hPa
  late num? humidity; // 空气湿度, %
  late num? seaLevel; // 海平面压力, hPa
  late num? grndLevel; // 地面大气压, hPa

  @override
  String toString() {
    return ('# [$dt] 天气状况: $description\n'
        '${wind.toString()}'
        '# 能见度: $visibility km\n'
        '# 云量: $clouds%\n'
        '${temp.toString()}'
        '${rain == null ? '# 降雨: null\n' : rain.toString()}'
        '${snow == null ? '# 降雪: null\n' : snow.toString()}'
        '# 降水概率: $pop\n'
        '# 紫外线指数: $uvIndex\n'
        '${sun == null ? '# 日出日落: null\n' : sun.toString()}'
        '${moon == null ? '# 月出月落: null\n' : moon.toString()}'
        '# 大气压强: $pressure\n'
        '# 海平面压力: $seaLevel\n'
        '# 地面大气压: $grndLevel\n'
        '# 空气湿度: $humidity\n');
  }

  String get dt {
    return dateTime == null ? '' : DateFormat('HH:mm').format(dateTime!);
  }

  WeatherInfoItem({
    int? dt,
    this.id,
    this.description,
    this.icon,
    this.wind,
    this.visibility,
    this.clouds,
    this.temp,
    this.rain,
    this.snow,
    this.uvIndex,
    this.sun,
    this.moon,
    this.pop,
    this.pressure,
    this.humidity,
    this.grndLevel,
    this.seaLevel,
  }) {
    dateTime = dt == null ? null : DateTime.fromMillisecondsSinceEpoch(dt);
  }
}

class WeatherInfo {
  late final String uuid;
  late Coord? coord;
  late WeatherInfoItem current;
  late List<WeatherInfoItem>? hourly;
  late List<PrecipItem>? minutely;
  late List<WeatherInfoItem>? daily;
  late List<WaringItem>? warings;
  late Air? air;

  WeatherInfo(
    this.current, {
    this.coord,
    this.hourly,
    this.minutely,
    this.daily,
    this.warings,
    this.air,
  }) {
    uuid = const Uuid().v4();
  }
}
