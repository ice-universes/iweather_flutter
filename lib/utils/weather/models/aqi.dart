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

class Pollution {
  late String unit; // 单位
  late String name; // 名称
  late num? value; // 数据

  Pollution(this.name, [this.value, this.unit = 'μg/m³']);

  @override
  String toString() {
    return '$value $unit';
  }
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

  Components({
    num? pm10,
    num? pm2p5,
    num? no2,
    num? so2,
    num? co,
    num? o3,
    num? nh3,
    num? no,
  }) {
    this.pm10 = Pollution('PM10', pm10);
    this.pm2p5 = Pollution('PM2.5', pm2p5);
    this.no2 = Pollution('NO₂', no2);
    this.so2 = Pollution('SO₂', so2);
    this.co = Pollution('CO', co);
    this.o3 = Pollution('O₃', o3);
    this.nh3 = Pollution('NH₃', nh3);
    this.no = Pollution('NO', no);
  }

  @override
  String toString() {
    return ('## pm10: ${pm10.toString()}\n'
        '## pm2p5: ${pm2p5.toString()}\n'
        '## so2: ${so2.toString()}\n'
        '## co: ${co.toString()}\n'
        '## o3: ${o3.toString()}\n'
        '## nh3: ${nh3.toString()}\n'
        '## no: ${no.toString()}\n');
  }
}

class Air {
  late DateTime? pubTime; // 发布时间
  late int aqi; // 空气质量指数
  late AqiInfoItem? info; // 当前空气质量信息
  late Components? components; // 污染物组成

  Air(this.aqi, {int? dt, this.components}) {
    pubTime = dt == null ? null : DateTime.fromMillisecondsSinceEpoch(dt);
    info = AqiInfo.aqiInfo(aqi);
  }

  @override
  String toString() {
    return ('# 空气质量指数: $aqi,\n'
        '## 污染物组成 ##\n'
        '$components');
  }
}
