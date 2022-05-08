import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iweather_flutter/routers/index.dart';
import 'package:iweather_flutter/utils/weather/models/warings.dart';
import 'package:iweather_flutter/utils/weather/models/aqi.dart';

class MainInfo extends StatelessWidget {
  final num temperature; // 温度
  final String unit; // 温度单位
  final num feelsLike; // 体感温度
  final String? description; // 天气状况
  final Air? air; // 空气质量
  final List<WaringItem>? warings; // 预警信息

  const MainInfo({
    Key? key,
    required this.temperature,
    required this.feelsLike,
    this.air,
    this.description,
    this.warings,
    this.unit = '℃',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          // Positioned 必须放在 Stack 里...😅
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$temperature$unit',
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$description, 体感 $feelsLike$unit",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Wrap(
                  spacing: 8, // 主轴(水平)方向间距
                  runSpacing: 4, // 纵轴(垂直)方向间距
                  // 沿主轴方向居中
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    // 这里是空气质量信息
                    OutlinedButton(
                      child: Text(
                        "空气质量 - ${air?.info?.category}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Get.toNamed(Routers.aqiPage);
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                      ),
                    ),
                    // 这里包含了预警信息...
                    ...?warings
                        ?.map(
                          (e) => OutlinedButton.icon(
                            icon: const Icon(
                              Icons.error_outline,
                              color: Colors.white,
                            ),
                            label: Text(
                              "${e.event}预警",
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                            ),
                          ),
                        )
                        .toList()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
