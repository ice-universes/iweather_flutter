import 'package:flutter/material.dart';
import 'package:iweather_flutter/utils/weather/models/weatherInfo.dart'
    show WeatherInfoItem;
import 'package:iweather_flutter/components/custom/IList.dart' show IList;
import 'package:iweather_flutter/components/custom/ICard.dart' show ICard;
import 'package:iweather_flutter/iconfont/icon_font.dart' show IconFont;

class HourItem extends StatelessWidget {
  final WeatherInfoItem weatherInfoItem;

  const HourItem({
    Key? key,
    required this.weatherInfoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // 点击事件
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weatherInfoItem.time,
            style: const TextStyle(fontSize: 15),
          ), // 时间
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
          Container(
            // 温度
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "${weatherInfoItem.temp?.temp}°",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
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
          // 风速
          Column(
            children: [
              Transform.rotate(
                angle: weatherInfoItem.wind?.deg?.toDouble() ?? 0.0,
                child: const Icon(
                  Icons.navigation,
                  color: Color(0xFFF8D800),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text('${weatherInfoItem.wind?.speed}')
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IHours extends StatelessWidget {
  final List<WeatherInfoItem> hourly;

  const IHours({Key? key, required this.hourly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ICard(
      title: '小时概况',
      height: 260,
      child: IList(
        children: <Widget>[
          // 遍历逐小时天气
          ...hourly.map((e) {
            return HourItem(
              weatherInfoItem: e,
            );
          }).toList(),
        ],
      ),
    );
  }
}
