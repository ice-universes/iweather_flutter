import 'package:intl/intl.dart';

class Precip {
  late num? oneHour; // 过去 1 小时的雨/雪量, mm
  late num? threeHours; // 过去 3 小时的雨/雪量, mm
  late PrecipItem? precip; // 当前降雨/雪量

  Precip(this.oneHour, this.threeHours, this.precip);
}

class Rain extends Precip {
  @override
  String toString() {
    return ('# 过去一小时降雨: $oneHour\n'
        '# 过去三小时降雨: $threeHours\n'
        '# 降雨量: ${precip.toString()}\n');
  }

  Rain({num? o, num? t, PrecipItem? p}) : super(o, t, p);
}

class Snow extends Precip {
  @override
  String toString() {
    return ('# 过去一小时降雪: $oneHour\n'
        '# 过去三小时降雪: $threeHours\n'
        '# 降雪量: ${precip.toString()}\n');
  }

  Snow({num? o, num? t, PrecipItem? p}) : super(o, t, p);
}

class PrecipItem {
  late num? precipitation; // 降水量
  late DateTime? dateTime; // 降水时刻

  PrecipItem({int? dt, this.precipitation}) {
    dateTime = dt == null ? null : DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  }

  String get dt {
    return dateTime == null ? '' : DateFormat('HH:mm').format(dateTime!);
  }

  @override
  String toString() {
    return '[$dateTime] $precipitation mm\n';
  }
}
