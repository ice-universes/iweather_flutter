import 'package:flutter/material.dart';
import 'package:iweather_flutter/utils/weather/models/weatherInfo.dart';
import 'package:iweather_flutter/utils/time.dart';
import 'package:iweather_flutter/iconfont/icon_font.dart' show IconFont;
import 'package:iweather_flutter/components/chart/single_bar.dart';
import 'package:iweather_flutter/components/custom/IList.dart' show IList;
import 'package:iweather_flutter/components/custom/ICard.dart' show ICard;

class DayItem extends StatelessWidget {
  final WeatherInfoItem weatherInfoItem;

  const DayItem({
    Key? key,
    required this.weatherInfoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // 点击事件
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 星期
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(week(weatherInfoItem.dateTime)),
            ),
            Container(
              // 天气状态
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "${weatherInfoItem.description}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              // 天气图标
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: IconFont(
                IconFont.getIconNames(
                  '_${weatherInfoItem.id}_${weatherInfoItem.icon}',
                ),
                size: 40,
              ),
            ),
            SingleBar(
              max: (weatherInfoItem.temp?.maxTemp)!,
              min: (weatherInfoItem.temp?.minTemp)!,
              average: (weatherInfoItem.temp?.average)!,
            ),
          ],
        ),
      ),
    );
  }
}

class IDays extends StatelessWidget {
  final List<WeatherInfoItem> daily;

  const IDays({Key? key, required this.daily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ICard(
      title: '逐日概述',
      height: 280,
      child: IList(
        children: [
          // 遍历逐小时天气
          ...daily.map((e) {
            return DayItem(
              weatherInfoItem: e,
            );
          })
        ],
      ),
    );
  }
}
