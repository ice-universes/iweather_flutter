import 'data_with_desc.dart';

class AqiInfoItem {
  late String color1;
  late String color2;
  late String desc;
  late String category;
  late int level;
  late int max;
  late int min;

  AqiInfoItem({
    required this.color1,
    required this.color2,
    required this.desc,
    required this.category,
    required this.level,
    required this.max,
    required this.min,
  });
}

// 空气质量 wiki: https://en.wikipedia.org/wiki/Air_quality_index#CAQI
class AqiInfo {
  static AqiInfoItem excellent = AqiInfoItem(
    color1: '#56B37F',
    color2: '#c0e674',
    desc: '空气质量令人满意, 基本无空气污染',
    category: '优',
    level: 1,
    max: 50,
    min: 0,
  );

  static AqiInfoItem good = AqiInfoItem(
    color1: '#FCFF00',
    color2: '#FFA8A8',
    desc: '空气质量可接受, 但某些污染物可能对极少数异常敏感人群健康有较弱影响',
    category: '良',
    level: 2,
    max: 100,
    min: 51,
  );

  static AqiInfoItem lightly = AqiInfoItem(
    color1: '#FEC163',
    color2: '#DE4313',
    desc: '易感人群症状有轻度加剧, 健康人群出现刺激症状',
    category: '轻度污染',
    level: 3,
    max: 150,
    min: 101,
  );

  static AqiInfoItem moderate = AqiInfoItem(
    color1: '#FFAA85',
    color2: '#B3315F',
    desc: '进一步加剧易感人群症状, 可能对健康人群心脏、呼吸系统有影响',
    category: '中度污染',
    level: 4,
    max: 200,
    min: 151,
  );

  static AqiInfoItem heavy = AqiInfoItem(
    color1: '#EE9AE5',
    color2: '#5961F9',
    desc: '心脏病和肺病患者症状显著加剧, 运动耐受力降低, 健康人群普遍出现症状',
    category: '重度污染',
    level: 5,
    max: 300,
    min: 201,
  );

  static AqiInfoItem serious = AqiInfoItem(
    color1: '#F05F57',
    color2: '#360940',
    desc: '健康人群运动耐受力降低, 有明显强烈症状, 提前出现某些疾病',
    category: '严重污染',
    level: 6,
    max: 500,
    min: 301,
  );

  static AqiInfoItem? aqiInfo(int aqi) {
    if (aqi >= 0 && aqi < 50) {
      return AqiInfo.excellent;
    } else if (aqi >= 50 && aqi < 100) {
      return AqiInfo.good;
    } else if (aqi >= 100 && aqi < 150) {
      return AqiInfo.lightly;
    } else if (aqi >= 150 && aqi < 200) {
      return AqiInfo.moderate;
    } else if (aqi >= 200 && aqi < 300) {
      return AqiInfo.heavy;
    } else if (aqi >= 500) {
      return AqiInfo.serious;
    }

    return null;
  }
}

class Pollution extends DataWithDesc {
  Pollution({
    required num value,
    required String name,
    String unit = 'μg/m³',
  }) : super(value, name, unit);
}

class Components {
  // 污染物组成
  late Pollution? pm10;
  late Pollution? pm2p5;
  late Pollution? no2;
  late Pollution? so2;
  late Pollution? co;
  late Pollution? o3;
  late Pollution? nh3;
  late Pollution? no;

  Components.fromMap(Map<String, dynamic> map) {
    pm10 = Pollution(value: map['pm10'], name: 'PM10');
    pm2p5 = Pollution(value: map['pm2_5'], name: 'PM2.5');
    no2 = Pollution(value: map['no2'], name: 'NO₂');
    so2 = Pollution(value: map['so2'], name: 'SO₂');
    co = Pollution(value: map['co'], name: 'CO');
    o3 = Pollution(value: map['o3'], name: 'O₃');
    nh3 = Pollution(value: map['nh3'], name: 'NH₃');
    no = Pollution(value: map['no'], name: 'NO');
  }
}

class Air {
  late DateTime pubTime; // 发布时间
  late int aqi; // 空气质量指数
  late AqiInfoItem? info; // 当前空气质量信息(可空)
  late Components components;

  Air.fromMap(Map<String, dynamic> map) {
    components = Components.fromMap(map['components']);
    pubTime = DateTime.fromMillisecondsSinceEpoch(map['dt']);
    aqi = map['main']['aqi'];
    info = AqiInfo.aqiInfo(aqi);
  }
}
