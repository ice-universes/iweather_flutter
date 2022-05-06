import 'package:intl/intl.dart';

class Sun {
  late DateTime? _sunRise;
  late DateTime? _sunSet;

  Sun({int? sr, int? ss}) {
    _sunRise = sr == null ? null : DateTime.fromMillisecondsSinceEpoch(sr * 1000);
    _sunSet = ss == null ? null : DateTime.fromMillisecondsSinceEpoch(ss * 1000);
  }

  String get sunRise {
    return _sunRise == null ? '' : DateFormat('HH:mm').format(_sunRise!);
  }

  String get sunSet {
    return _sunSet == null ? '' : DateFormat('HH:mm').format(_sunSet!);
  }

  @override
  toString() {
    return ('# 日出时间: $sunRise\n'
        '# 日落时间: $sunSet\n');
  }
}

class Moon {
  late DateTime? _moonRise;
  late DateTime? _moonSet;
  late num? moonPhase;

  Moon({int? mr, int? ms, this.moonPhase}) {
    _moonRise = mr == null ? null : DateTime.fromMillisecondsSinceEpoch(mr * 1000);
    _moonSet = ms == null ? null : DateTime.fromMillisecondsSinceEpoch(ms * 1000);
  }

  String get moonRise {
    return _moonRise == null ? '' : DateFormat('HH:mm').format(_moonRise!);
  }

  String get moonSet {
    return _moonSet == null ? '' : DateFormat('HH:mm').format(_moonSet!);
  }

  @override
  toString() {
    return ('月出时间: $moonRise\n'
        '月落时间: $moonSet\n'
        '月相: $moonPhase\n');
  }
}
